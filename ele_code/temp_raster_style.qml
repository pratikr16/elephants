<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.2.0-Bonn" maxScale="0" minScale="1e+8" hasScaleBasedVisibilityFlag="0">
  <pipe>
    <rasterrenderer band="1" alphaBand="-1" opacity="1" classificationMin="20" classificationMax="35" type="singlebandpseudocolor">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader clip="0" colorRampType="INTERPOLATED" classificationMode="2">
          <colorramp name="[source]" type="cpt-city">
            <prop k="inverted" v="0"/>
            <prop k="rampType" v="cpt-city"/>
            <prop k="schemeName" v="ncl/BlueYellowRed"/>
            <prop k="variantName" v=""/>
          </colorramp>
          <item label="20" alpha="255" value="20" color="#052350"/>
          <item label="23.8" alpha="255" value="23.75" color="#57a5cf"/>
          <item label="27.5" alpha="255" value="27.5" color="#ffffc8"/>
          <item label="31.3" alpha="255" value="31.25" color="#ec9f2c"/>
          <item label="35" alpha="255" value="35" color="#872817"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeGreen="128" colorizeRed="255" colorizeBlue="128" grayscaleMode="0" saturation="9" colorizeStrength="100" colorizeOn="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
