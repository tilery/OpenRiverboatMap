Map { background-color: @water; }

#waterway_network[zoom>=5][zoom<=12][navigable='yes'] {
  line-color: @navigable_high;
  [zoom>=11] {
    line-color: @navigable_medium;
  }
  [zoom=5] {
      line-width: 0.5;
  }
  [zoom=6] {
      line-width: 1;
  }
  [zoom=7] {
      line-width: 2;
  }
  [zoom=8] {
      line-width: 3;
  }
  [zoom=9] {
    [type='canal'] { line-width: 4; }
    [type='river'] { line-width: 3; }
  }
  [zoom=10] {
    [type='canal'] { line-width: 5; }
    [type='river'] { line-width: 4; }
  }
  [zoom=11] {
    [type='canal'] { line-width: 6; }
    [type='river'] { line-width: 5; }
  }
  [zoom=12] {
    [type='canal'] { line-width: 7; }
    [type='river'] { line-width: 6; }
  }
}
#waterway_network_high[zoom>=13] {
  line-color: @water;
  [navigable='yes'] {
    line-color: @navigable;
  }
  [type='stream'] { line-width: 1; }
  [type='canal'] { line-width: 4; }
  [type='river'] { line-width: 6; }
  [zoom>=15] {
    [type='stream'] { line-width: 2; }
    [type='canal'] { line-width: 6; }
    [type='river'] { line-width: 8; }
  }
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

#water[zoom>5],
#landuse[type='basin'][zoom>=13] {
  polygon-fill: @water;
  [navigable='yes'] { polygon-fill: @navigable;}
}

#navigable_water[zoom>=13] {
  ::bridge[bridge='yes'] {
    line-color: @navigable * 0.8;
    line-width: 2;
  }
	polygon-fill: @navigable;
}

/* ================================================================== */
/* MOORING
/* ================================================================== */

#piers::outline[zoom>=14][mooring='yes'] {
	line-color: @mooring;
	line-width: 3;
  line-cap: round;
  [zoom>16] {
  	line-width: 5;
  }
}
#piers[zoom>=14] {
  line-cap: butt;
	line-color: @land;
	line-width: 2;
  [zoom>16] {
    line-width: 3;
  }
}
#piers_polygons[zoom>=14] {
  polygon-fill: @land;
}
#groyne[zoom>=14] {
  line-cap: butt;
  line-color: @land;
  line-width: 1;
  [zoom>16] {
    line-width: 2;
  }
}

/* ================================================================== */
/* DAMS
/* ================================================================== */
#dams[zoom>=14] {
  line-cap: butt;
  line-color: @land;
  line-width: 3;
  [zoom>16] {
    line-width: 4;
  }
}
#dams_polygons[zoom>=14] {
  polygon-fill: @land;
}
