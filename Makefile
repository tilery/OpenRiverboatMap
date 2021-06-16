PBF ?= "europe/france/ile-de-france-latest.osm.pbf"
all: download import
download:
	wget --show-progress --directory-prefix=tmp/pbf/ --force-directories --no-host-directories http://download.geofabrik.de/$(PBF)
import:
	osm2pgsql -G -d osm tmp/pbf/$(PBF) --hstore --create
