Open Riverboat Map
==================

Open Riverboat Map plans to make an open source CartoCSS map style of navigable waterways, on top of OpenStreetMap project.

Open Riverboat Map is derived from `OSM-bright <https://github.com/mapbox/osm-bright>`_ MapBox project.


Design philosophy
-----------------

* at **low zoom level**, all the navigable waterways network should appear clearly ; all other informations are diminished, unless some main geographical informations that helps understand the situation (mainly big cities)

* at **intermediate zoom level**, the navigable waterways remain the central informations, but also some other usefull informations must be visible: main harbours, locks (quietly)... Non "riverboat" informations begin to become visible, but allways in second place

* at **high zoom level**, we try to display as useful informations as possible for the "inland navigator": mooring places, height of bridges, number of arches for a bridge, oneways...


Getting involved
----------------

* symlink the `openriverboatmap` directory into your TileMill projects directory (by default in `~/Documents/MapBow/project/`).

* import some OSM data with `osm2pgsql <http://wiki.openstreetmap.org/wiki/Osm2pgsql>`_ , using default style but **with option --hstore-all** (or ping me to get a psql dump)

* indexes to create::

    CREATE INDEX idx_planet_osm_line_motorboat_waterway ON planet_osm_line USING btree(waterway,(tags->'motorboat')) WHERE waterway IS NOT NULL AND tags ? 'motorboat';
    CREATE INDEX idx_planet_osm_polygon_leisure ON planet_osm_polygon USING btree(leisure) WHERE leisure IS NOT NULL;
    CREATE INDEX idx_planet_osm_polygon_waterway ON planet_osm_polygon USING btree(waterway,way_area) WHERE waterway IS NOT NULL;
    CREATE INDEX idx_planet_osm_polygon_natural ON planet_osm_polygon USING btree("natural",way_area) WHERE "natural" IS NOT NULL;

* start hacking the style, commit in a branch, and make a pull request! :)


Screenshots
-----------

.. image:: http://i.imgur.com/jAXYLh.png
.. image:: http://i.imgur.com/HfEtJh.jpg
.. image:: http://i.imgur.com/NoJmAh.png
.. image:: http://i.imgur.com/5agyi.png
.. image:: http://www.s258792424.onlinehome.fr/aquanomade/phpBB3/download/file.php?id=1035
