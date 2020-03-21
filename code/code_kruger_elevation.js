var image = ee.Image("USGS/SRTMGL1_003"),
    table = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    ext = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    geometry = /* color: #d63000 */ee.Geometry.MultiPoint();
    
//filter 30m DEM for the polygon
var srtm_clip = image.clip(ext.geometry());

Map.addLayer(table);

//get slope
var srtm_slope = ee.Terrain.slope(srtm_clip);

//check elevation map
Map.addLayer(srtm_clip, {min: 0, max :500, palette: ["#00A600FF", "#2DB600FF", "#63C600FF", "#A0D600FF", "#E6E600FF", "#E8C32EFF",
"#EBB25EFF", "#EDB48EFF", "#F0C9C0FF", "#F2F2F2FF"
]}, 'elevation');

// check slope map
Map.addLayer(srtm_slope, {min: 0, max :10, palette: ["#00A600FF", "#2DB600FF", "#63C600FF", "#A0D600FF", "#E6E600FF", "#E8C32EFF",
"#EBB25EFF", "#EDB48EFF", "#F0C9C0FF", "#F2F2F2FF"
]}, 'slope');

//export to file
Export.image.toDrive({
  image: srtm_clip,
  description: 'kruger_elevation',
  scale: 30,
  region: table.geometry()
});

Export.image.toDrive({
  image: srtm_slope,
  description: 'kruger_slope',
  scale: 30,
  region: table.geometry()
});
