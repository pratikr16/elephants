// get extent and landsat 5 data
var geometry = /* color: #ff3d3d */ee.Geometry.Polygon(
        [[[77.26686452041235, 13.344492655458648],
          [77.26803063514615, 12.69020162411501],
          [78.31220864869454, 12.698000169170149],
          [78.31998125667042, 13.342950249131635]]]),
    table = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    table2 = ee.FeatureCollection("users/pratik_unterwegs/kruger_clip"),
    l5 = ee.ImageCollection("LANDSAT/LT05/C01/T1_SR");

//define func
var crop = function(x){
  var image = x.
  clip(table).
  divide(10).
  subtract(273);
  return image;
}

// filter landsat 5 data for time, cloud cover, and thermal band
var filtered = l5.filterDate('2007-08-01', '2009-08-30').
  filterMetadata('CLOUD_COVER', 'less_than', 10).
  select('B6').
  map(crop).
 mean();

var rgb_viz = {min: 20, max: 35, bands:['B6'],
  palette: ["#0D0887FF", "#4C02A1FF", "#7E03A8FF", "#A92395FF", "#CC4678FF", "#E56B5DFF","#F89441FF", "#FDC328FF", "#F0F921FF"]
};

Map.addLayer(filtered, rgb_viz, 'kruger_temp');

// export to google drive
Export.image.toDrive({
  image: filtered,
  description: 'kruger_temperature',
  scale: 30,
  region: table.geometry()});