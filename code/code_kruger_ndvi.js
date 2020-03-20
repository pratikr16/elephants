var kruger = ee.FeatureCollection("users/pratik_unterwegs/ele_ext"),
    landsat = ee.ImageCollection("LANDSAT/LT05/C01/T1_SR"),
    table = ee.FeatureCollection("users/pratik_unterwegs/ele_ext");
    
//define func
var crop = function(x){
  //var image = x.clipToCollection(kruger);
  return image;
}

//import sentinel 2 and study area bounds
//get table as a geometry obj
var ext = kruger.geometry();

//filter sentinel for may 2017
var landsatclip = landsat.filterDate('2007-01-01', '2009-12-30')
  //.map(crop)
  .filterMetadata('CLOUD_COVER', 'less_than', 5);

var addNDVI = function(image) {
  var ndvi = image.normalizedDifference(['B4', 'B3']).rename('ndvi');
  return image.addBands([ndvi]);
}

var ndvi = landsatclip.map(addNDVI);

//plot
Map.centerObject(kruger, 10);
Map.addLayer(ndvi.select(['ndvi']).filterBounds(kruger).mean(), 
  {min:0, max:0.6, palette: ['#d8b365','#f5f5f5', '#5ab4ac']}, 'NDVI');
//Map.addLayer(ext);

//chart
var chart01 = ui.Chart.image.series(ndvi.select('ndvi'),
  kruger.geometry());
print(chart01);

//write an export function

Export.image.toDrive({
  image: ndvi.select(['ndvi']).filterBounds(kruger).mean(),
  description: 'kruger_landsat7_surface_ndvi',
  scale: 30,
  region: kruger});
