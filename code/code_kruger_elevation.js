var image = ee.Image("USGS/SRTMGL1_003"),
    table = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    ext = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    geometry = /* color: #d63000 */ee.Geometry.MultiPoint();
    
//filter 30m DEM for the polygon
var srtm_clip = image.clip(ext.geometry());

Map.addLayer(table);

//get slope
var srtm_slope = ee.Terrain.slope(srtm_clip);

//check map
Map.addLayer(srtm_clip, {min: 0, max :2000}, 'slope');

//export to file
Export.image.toDrive({
  image: srtm_clip,
  description: 'kruger_elevation',
  scale: 30,
  region: table.geometry()
});
