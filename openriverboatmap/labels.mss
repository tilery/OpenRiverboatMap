/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* Mapnik does not yet support character-spacing adjustments for 
   labels placed along a line. We can fake this using the replace()
   function in the text-name parameter by replacing each character
   with itself followed by one or more spaces. */

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

#place::country[type='country'][zoom>3][zoom<6] {
  text-name:'[name]';
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  [zoom=3] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=4] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>4] {
    text-halo-radius: 2;
  }
  [zoom=5] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=6] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=7] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

#place::state[type='state'][zoom>=8][zoom<=10] {
  text-name:'[name]';
  text-face-name:@sans_bold_italic;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 1;
  [zoom=6] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=7] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>8] {
    text-halo-radius: 2;
  }
  [zoom=8] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

/* ---- Cities ------------------------------------------------------ */

#place::city[type='city'][zoom>=8][zoom<=16] {
  text-name:'[name]';
  text-face-name:@sans_italic;
  text-placement:point;
  text-fill:@city_text;
  text-halo-fill:@city_halo;
  text-halo-radius:2;
  text-transform: uppercase;
  text-label-position-tolerance: 50;
  [zoom<=8] {
    text-size: 9;
    text-halo-radius:1;
  }
  [zoom=9] {
    text-size:10;
    text-wrap-width: 60;
  }
  [zoom=10] {
    text-size:11;
    text-wrap-width: 70;
  }
  [zoom=11] {
    text-size:12;
    text-character-spacing: 1;
    text-wrap-width: 80;
  }
  [zoom=12] {
    text-size:13;
    text-character-spacing: 1;
    text-wrap-width: 100;
  }
  [zoom=13] {
    text-size:14;
    text-character-spacing: 2;
    text-wrap-width: 200;
  }
  [zoom=14] {
    text-size:15;
    text-character-spacing: 4;
    text-wrap-width: 300;
  }
  [zoom=15] {
    text-size:16;
    text-character-spacing: 6;
    text-wrap-width: 400;
  }
}

/* ---- Towns ------------------------------------------------------- */

#place::town[type='town'][zoom>=10][zoom<=17] {
  text-name:'[name]';
  text-face-name: @sans_lt_italic;
  text-placement:point;
  text-fill:@town_text;
  text-size:9;
  text-halo-fill:@town_halo;
  text-halo-radius:1;
  text-wrap-width: 50;
  text-min-distance: 10;
  text-label-position-tolerance: 50;
  [zoom>=10] {
    text-halo-radius:2;
    text-fill: lighten(@town_text,5%);
    text-size: 10;
  }
  [zoom>=11]{ text-size:11; }
  [zoom>=12]{
    text-size:12;
    text-line-spacing: 1;
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    text-line-spacing: 2;
  }
  [zoom>=14]{
    text-size:13;
    text-character-spacing: 2;
    text-line-spacing: 3;
  }
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    text-line-spacing: 4;
  }
  [zoom>=15]{
    text-size:15;
    text-character-spacing: 4;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-character-spacing: 5;
    text-line-spacing: 6;
  }
}

/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=11],
#place::small[type='suburb'][zoom>=13],
#place::small[type='hamlet'][zoom>=13] {
  text-name:'[name]';
  text-face-name: @sans_lt_italic;
  text-placement:point;
  text-fill:@other_text;
  text-size:10;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-min-distance: 10;
  [zoom>=14] {
    text-size:11;
    text-character-spacing: 1;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
  }
  [zoom>=16] {
    text-size:12;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
  } 
  [zoom>=17] {
    text-size:13; 
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place::small[type='locality'][zoom>=15] {
  text-name:'[name]';
  text-face-name: @sans_lt_italic;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=16] {
    text-size:10;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}


// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=10][area>102400000],
  [zoom>=11][area>25600000],
  [zoom>=13][area>1600000],
  [zoom>=14][area>320000],
  [zoom>=15][area>80000],
  [zoom>=16][area>20000],
  [zoom>=17][area>5000],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
      text-face-name: @sans_lt_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10%);
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10%);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10%);
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10%);
    }
    [type='college'][zoom>=10],
    [type='school'][zoom>=10],
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10%);
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10%);
    }
  }
  [zoom=15][area>1600000],
  [zoom=16][area>80000],
  [zoom=17][area>20000],
  [zoom=18][area>5000] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
    text-halo-radius: 2;
  }
  [zoom=16][area>1600000],
  [zoom=17][area>80000],
  [zoom=18][area>20000] {
    text-size: 15;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
  [zoom>=17][area>1600000],
  [zoom>=18][area>80000] {
    text-size: 20;
    text-character-spacing: 3;
    text-wrap-width: 180;
  }
}
   
#poi[type='university'][zoom>=15],
#poi[type='hospital'][zoom>=16],
#poi[type='school'][zoom>=17],
#poi[type='library'][zoom>=17] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10;
  text-wrap-width:30;
  text-fill: @poi_text;
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance: 200;
  text-size:10;
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:100;
  text-size:11;
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#motorway_label[oneway!=0][zoom>=16],
#mainroad_label[oneway!=0][zoom>=16],
#minorroad_label[oneway!=0][zoom>=16] {
  marker-placement:line;
  marker-max-error: 0.5;
  marker-spacing: 200;
  marker-file: url("icons/oneway.svg");
  [oneway=-1] { marker-file: url("icons/oneway-reverse.svg"); }
  [zoom=16] { marker-transform: "scale(0.5)"; }
  [zoom=17] { marker-transform: "scale(0.75)"; }
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[navigable='yes'][zoom>=7][zoom<18],
#waterway_label[type='river'][navigable='no'][zoom>=13][zoom<18],
#waterway_label[type='canal'][navigable='no'][zoom>=13][zoom<18],
#waterway_label[type='stream'][navigable='no'][zoom>=17] {
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-name: "[name]";
  text-face-name: @sans_italic;
  text-placement: line;
  text-size: 11;
  [navigable='yes'] {
    text-fill: @navigable_text;
    text-halo-fill: fadeout(#fff,25%);
  }
  [navigable='yes'][zoom<13] {
    text-halo-radius: 2;
    text-label-position-tolerance: 100;
    text-min-distance: 70;
    [zoom<=10] {
      text-min-distance: 50;
      text-placement: point;
    }
  }
  [zoom>=13] {
    text-halo-radius: 1;
    text-min-distance: 400;
  }
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
  }
  [type='river'][zoom>=16] {
    text-size: 14;
    text-spacing: 300;
  }
}

#waterway_label::oneway[oneway=-1][zoom>=17],
#waterway_label::oneway[oneway='alternate'][zoom>=17],
#waterway_label::oneway[oneway='yes'][zoom>=17] {
  text-name:"''";
  text-face-name: @sans;
  text-min-distance: 0;
  text-spacing: 100;
  [zoom=18] {
    text-spacing: 200;
  }
  text-placement: line;
  text-fill: #fff * 0.75;
  text-size: 16;
  [oneway='yes'] {
    text-name:"'→'";
  }
  [oneway=-1] {
    text-name:"'←'";
  }
  [oneway='alternate'] {
    text-name:"'←→'";
  }
}

/* ================================================================== */
/* WATERWAY POIS
/* ================================================================== */

#marinas[seasonal='no'][zoom>=7][zoom<18],
#marinas[seasonal='yes'][zoom>=10][zoom<18] {
  shield-file: url('./icons/harbour.svg');
  // [seasonal='yes'] {
  //   shield-file: url('./icons/seasonal.svg');
  // }
  shield-text-dy: 3;
  shield-text-dx: 3;
  shield-face-name: @sans_bold;
  shield-fill: @harbour_text;
  shield-halo-fill: @harbour_halo;
  shield-halo-radius: 2;
  shield-size: 10;
  shield-placement-type: simple;
  shield-placements: "NE,NW,SE,SW,E,W,N,S";
  shield-min-distance: 5;
  shield-unlock-image: true;
  shield-name:"[name].replace('[Hh]alte ([Nn]autique )?(de |du |d\'|des )','').replace('[Pp]ort (de [Pp]laisance )?(de |du |d\'|des )','')";
  [seasonal='yes'] {
    shield-face-name: @sans;
    shield-fill:@marina_text;
    shield-halo-fill:@marina_halo;
  }
}
#locks::label[zoom>=14] {
  shield-file: url('./icons/lock.svg');
  shield-text-dy: 4;
  shield-text-dx: 6;
  shield-name: "[lock_name]";
  shield-face-name: @sans;
  shield-placement: point;
  shield-fill: @marina_text;
  shield-size: 10;
  shield-halo-fill: @marina_halo;
  shield-halo-radius: 2;
  shield-wrap-width: 50;
  shield-placement-type: simple;
  shield-placements: "E,W,N,S,NE,NW,SE,SW";
  shield-unlock-image: true;
}
#piers_symbol[mooring='yes'][zoom>=10][zoom<=14] {
  marker-file: url('./icons/pier.svg');
  [zoom<=11] {
    marker-transform: scale(.6,.6);
  }
  [zoom=12] {
    marker-transform: scale(.8,.8);
  }
}
#pois[type='drinking_water'][zoom>=15] {
    marker-file: url('./icons/water_point.svg');
}
#pois[type='waste_disposal'][zoom>=15] {
    marker-file: url('./icons/rubbish.svg');
	[waste='chemical_toilet'] { marker-file: url('./icons/elsan.svg'); }
}
#pois[type='fuel'][zoom>=15] {
    marker-file: url('./icons/fuel.svg');
}
#pois[type='shower'][zoom>=15] {
    marker-file: url('./icons/shower.svg');
}
#pois[type='toilets'][zoom>=15] {
    marker-file: url('./icons/toilets.svg');
}

/* ================================================================== */
/* WATERWAY SIGNS
/* ================================================================== */

#waterway_signs[sign='kilometer'][zoom>=16] {
  text-name: "[name]";
  text-face-name:@sans;
  text-placement:point;
  text-fill:@marina_text;
  text-size:10;
  text-halo-fill:@marina_halo;
  text-halo-radius:2;
  text-wrap-width: 50;
  text-label-position-tolerance: 10;
}

#waterway_signs[zoom>=16] {
  marker-file: url("./icons/waterway/sign/[sign].png");
  marker-width: 15;
  [zoom=18] {
    marker-width: 20;
  }
}

#waterway_network::draft[zoom>=16] {
[cemt="I"][draft<1.8],
[cemt="II"][draft<2.5],
[cemt="III"][draft<2.5],
[cemt="IV"][draft<2.5],
[cemt="V"][draft<2.5],
[cemt="VI"][draft<3.9] {
  shield-name: "[draft]";
  shield-fill:#000;
  shield-face-name:@sans;
  shield-size:8;
  shield-placement: line;
  shield-spacing: 300;
  shield-file: url('./icons/waterway/sign/maxdraft_17.svg');
  shield-text-dy: -2;
  shield-avoid-edges: true;
  [zoom=18] {
    shield-file: url('./icons/waterway/sign/maxdraft_18.svg');
    shield-spacing: 400;
    shield-size:9;
  }
}}

#waterway_network::maxspeed[maxspeed!=null][zoom>=16] {
  shield-name: "[maxspeed]";
  shield-fill:#000;
  shield-face-name:@sans;
  shield-size:8;
  shield-placement: line;
  shield-spacing: 200;
  shield-file: url('./icons/waterway/sign/no_17.svg');
  shield-avoid-edges: true;
  [zoom=18] {
    shield-file: url('./icons/waterway/sign/no_18.svg');
    shield-spacing: 300;
    shield-size:9;
  }
}


/* ================================================================== */
/* PIERS
/* ================================================================== */

#piers::label[zoom>=17],
#piers_polygons::label[zoom>=17]
{
  text-name: "[name]";
  text-face-name:@sans;
  text-placement:line;
  text-fill:@marina_text;
  text-size:10;
  text-halo-fill:@marina_halo;
  text-halo-radius:2;
  text-wrap-width: 50;
  text-label-position-tolerance: 10;
}


/* ================================================================== */
/* Stations
/* ================================================================== */

.stations[railway='station'][zoom>=13] {
  ::symbol {
    marker-file: url('./icons/station.svg');
  }
  text-name: "[name]";
  text-face-name:@sans_bold_italic;
  text-fill: @other_text;
  text-size:11;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-label-position-tolerance: 24;
  text-placement-type: simple;
  text-placements: "E,W";
  text-dx: 12;
}


/* ================================================================== */
/* Organic Shops
/* ================================================================== */

#organic_shop[zoom>=14] {
  ::symbol {
    marker-file: url('./icons/organic.svg');
  }
  text-name: "[name]";
  text-face-name:@sans_bold_italic;
  text-fill: @other_text;
  text-size:11;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-label-position-tolerance: 24;
  text-placement-type: simple;
  text-placements: "E,W";
  text-dx: 12;
}