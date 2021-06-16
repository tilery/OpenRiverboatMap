/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

Map {buffer-size: 256;}

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land-low[zoom>=0][zoom<6],
#land[zoom>=6] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
}

#landuse_gen0[zoom>3][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='grave_yard']    { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='golf_course']   { polygon-fill: @park; }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='landfill']      { polygon-fill: darken(@industrial,10%); }
  [type='quarry']        { polygon-fill: @industrial; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_case; }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_centre'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='pitch']         { polygon-fill: @sports; polygon-opacity: 0.8; }
  [type='grass']         { polygon-fill: @grass; }
  [type='park']          { polygon-fill: @park; }
  [type='garden']        { polygon-fill: @park; }
  [type='village_green'] { polygon-fill: @park; }
  [type='recreation_ground'] { polygon-fill: @park; }
  [type='picnic_site']   { polygon-fill: @park; }
  [type='camp_site']   { polygon-fill: @park; }
  [type='playground']    { polygon-fill: @park; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='wood']          { polygon-fill: @wooded; }
  [type='heath']         { polygon-fill: @heath; }
  [type='meadow']        { polygon-fill: @heath; }
  [type='scrub']         { polygon-fill: @heath; }
  [type='farmland']      { polygon-fill: @agriculture; }
  [type='farm']          { polygon-fill: @agriculture; }
  [type='orchard']       { polygon-fill: @agriculture; }
  [type='allotments']    { polygon-fill: @agriculture; }
  [type='military']      { polygon-fill: @military; }
  [type='beach']         { polygon-fill: @beach; }
  [type='wetland']       { polygon-fill: @wetland; } 
}

#landuse_overlays[type='nature_reserve'][zoom>6] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  [zoom=7] { line-width: 0.4; }
  [zoom=8] { line-width: 0.6; }
  [zoom=9] { line-width: 0.8; }
  [zoom=10] { line-width: 1.0; }
  [zoom=11] { line-width: 1.5; }
  [zoom>=12] { line-width: 2.0; }
}

/* ---- BUILDINGS ---- */
#buildings[zoom>=13] {
  polygon-fill:@building;
  [zoom>=14] {
    line-color:darken(@building,5%);
    line-width:0.2;
  }
  [zoom>=16] {
    line-color:darken(@building,10%);
    line-width:0.4;
  }
}


/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin[zoom>1] {
  ::outline {
    line-color: lighten(@admin_2, 25%);
    line-width: 2.5;
    line-opacity: 0.3;
  }
  line-color: @admin_2;
  line-width: 0.5;
  line-dasharray: 20,10,5,10;
  line-opacity: 0.6;
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5%);

}
