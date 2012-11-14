from fabric.api import (task, env, run, local, roles, cd, execute, hide,
                        puts, sudo, prefix)
import os


env.project_name = 'openriverboatmap'
env.repository = 'git://github.com/yohanboniface/OpenRiverboatMap.git'
env.local_branch = 'master'
env.remote_ref = 'origin/master'
env.requirements_file = 'requirements.pip'
env.restart_sudo = False
env.download_command = 'wget {url} -O {file}'
env.import_command = 'osm2pgsql -G -U osm -d osm {file} -C 4000 --number-processes=6 --hstore-all --append'

#==============================================================================
# Tasks which set up deployment environments
#==============================================================================


@task
def live():
    """
    Use the live deployment environment.
    """
    server = 'openriverboatmap.com'
    env.roledefs = {
        'web': [server],
        'db': [server],
    }
    env.system_users = {server: 'www-data'}
    env.virtualenv_dir = '/home/ybon/.virtualenvs/{project_name}'.format(**env)
    env.project_dir = '{virtualenv_dir}/src/{project_name}'.format(**env)
    env.project_conf = '{project_name}.conf.local'.format(**env)
    env.restart_command = 'circusctl restart {project_name}'.format(**env)


@task
def dev():
    """
    Use the development deployment environment.
    """
    server = 'ks3267459.kimsufi.com'
    env.roledefs = {
        'web': [server],
        'db': [server],
    }
    env.system_users = {server: 'www-data'}
    env.virtualenv_dir = '/home/ybon/.virtualenvs/{project_name}'.format(**env)
    env.project_dir = '/home/ybon/dev/{project_name}'.format(**env)
    env.restart_command = '{virtualenv_dir}/bin/circusctl restart {project_name}'.format(**env)
    env.pbf_dir = '~/pbf'

# Set the default environment.
dev()


#==============================================================================
# Actual tasks
#==============================================================================

@task
@roles('web', 'db')
def push():
    """
    Push branch to the repository.
    """
    remote, dest_branch = env.remote_ref.split('/', 1)
    local('git push {remote} {local_branch}:{dest_branch}'.format(
        remote=remote, dest_branch=dest_branch, **env))


@task
def deploy(verbosity='normal'):
    """
    Full server deploy.

    Updates the repository (server-side), synchronizes the database, collects
    static files and then restarts the web service.
    """
    if verbosity == 'noisy':
        hide_args = []
    else:
        hide_args = ['running', 'stdout']
    with hide(*hide_args):
        puts('Updating repository...')
        execute(update)
        puts('Generate mapnik style...')
        execute(generate_style)
        puts('Restarting web server...')
        execute(restart)


@task
@roles('web', 'db')
def update(mode='graceful'):
    """
    Update the repository (server-side).

    By default, if the requirements file changed in the repository then the
    requirements will be updated. Use ``action='force'`` to force
    updating requirements. Anything else other than ``'check'`` will avoid
    updating requirements at all.
    """
    with cd(env.project_dir):
        remote, dest_branch = env.remote_ref.split('/', 1)
        run('git fetch {remote}'.format(remote=remote,
            dest_branch=dest_branch, **env))
        with hide('running', 'stdout'):
            changed_files = run('git diff-index --cached --name-only '
                '{remote_ref}'.format(**env)).splitlines()
        if not changed_files and mode != 'force':
            # No changes, we can exit now.
            return
        run('git merge {remote_ref}'.format(**env))
        if mode == "clean":
            run('git clean -df')


@task
@roles('web')
def restart():
    """
    Restart the web service.
    """
    if env.restart_sudo:
        cmd = sudo
    else:
        cmd = run
    cmd(env.restart_command)


@task
@roles('web', 'db')
def update_data(url):
    """
    Import a pbf OSM data file.
    """
    file_path = "%s/%s" % (env.pbf_dir, os.path.basename(url))
    with hide('running', 'stdout'):
        file_exists = run('if [ -d "{file}" ]; then echo 1; fi'\
            .format(file=file_path))
        if file_exists:
            run("rm {file}".format(file=file_path))
    run(env.download_command.format(url=url, file=file_path))
    run(env.import_command.format(file=file_path))


@task
@roles('web', 'db')
def generate_style():
    """
    Generate mapnik style.
    """
    # Needed to make millstone quiet
    # otherwise it output logs and we get an invalid XML
    with prefix('export NODE_ENV="quiet"'):
        run('carto {project_dir}/openriverboatmap/project.mml > {project_dir}/openriverboatmap/mapnik.xml'.format(**env))
