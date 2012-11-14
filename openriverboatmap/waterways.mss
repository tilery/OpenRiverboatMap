Map { background-color: @water; }

#waterway_low[zoom>=5][zoom<=12] {
  [motorboat='yes'] { line-color: @navigable; }
  [zoom=5] {
    [type='river'] { line-width: 0.5; }
    [type='canal'] { line-width: 0.25; } }
  [zoom=6] {
    [type='river'] { line-width: 1; }
    [type='canal'] { line-width: 0.5; } }
  [zoom=7] {
    [type='river'] { line-width: 2; }
    [type='canal'] { line-width: 1; } }
  [zoom=8] {
    [type='canal'] { line-width: 3; }
    [type='river'] { line-width: 2; }
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

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */


#water_gen0[zoom>3][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>5] {
  polygon-fill: @water;
  [motorboat='yes'] { polygon-fill: @navigable;}
  [zoom>=14][type='lock'] { line-color: @stone;}
}

/* ================================================================== */
/* MARINAS
/* ================================================================== */

/*#marinas[harbour=1][zoom>=7][zoom<=14] {
  marker-width: 20;
  marker-height: 20;
  marker-file: url("icons/harbour.svg");
}

#marinas[harbour=0][zoom>=10][zoom<=14] {
  marker-file: url("icons/marina.svg");
  marker-width: 20;
  marker-height: 20;
}*/

/* ================================================================== */
/* MOORING
/* ================================================================== */

#piers[zoom>=14] {
	line-color: @mooring;
	line-color: @mooring;
  [zoom=14] {
    line-width: 2;
  }
  [zoom=15] {
    line-width: 3;
  }
  [zoom=16] {
    line-width: 4;
  }
  [zoom=17] {
    line-width: 5;
  }
  [zoom=18] {
    line-width: 6;
  }
}

/* ================================================================== */
/* LOCKS
/* ================================================================== */
