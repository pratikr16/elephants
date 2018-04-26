<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" maxScale="0" minScale="1e+8" version="3.0.1-Girona">
  <pipe>
    <rasterrenderer type="singlebandpseudocolor" opacity="1" alphaBand="-1" classificationMax="0.55" band="1" classificationMin="0.1">
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
        <colorrampshader colorRampType="INTERPOLATED" classificationMode="2" clip="0">
          <colorramp type="cpt-city" name="[source]">
            <prop k="inverted" v="1"/>
            <prop k="rampType" v="cpt-city"/>
            <prop k="schemeName" v="wkp/tubs/nrwc"/>
            <prop k="variantName" v=""/>
          </colorramp>
          <item value="0.1" alpha="255" color="#d77f3f" label="0.1"/>
          <item value="0.2125" alpha="255" color="#d7be6b" label="0.213"/>
          <item value="0.325" alpha="255" color="#6ca363" label="0.325"/>
          <item value="0.4375" alpha="255" color="#265337" label="0.438"/>
          <item value="0.55" alpha="255" color="#050603" label="0.55"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="10" contrast="15"/>
    <huesaturation saturation="0" colorizeBlue="128" colorizeRed="255" colorizeStrength="100" grayscaleMode="0" colorizeGreen="128" colorizeOn="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
