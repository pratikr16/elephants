<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" maxScale="0" hasScaleBasedVisibilityFlag="0" version="3.2.1-Bonn">
  <pipe>
    <rasterrenderer classificationMin="21.7778" opacity="0.7" alphaBand="-1" type="singlebandpseudocolor" band="1" classificationMax="33">
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
        <colorrampshader clip="0" classificationMode="2" colorRampType="INTERPOLATED">
          <colorramp name="[source]" type="gradient">
            <prop k="color1" v="30,92,179,255"/>
            <prop k="color2" v="164,38,44,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.055;30,92,179,255:0.055;23,111,193,255:0.1117;23,111,193,255:0.1117;11,142,216,255:0.1667;11,142,216,255:0.1667;4,161,230,255:0.2217;4,161,230,255:0.2217;25,181,241,255:0.2783;25,181,241,255:0.2783;51,188,207,255:0.3333;51,188,207,255:0.3333;102,204,206,255:0.3883;102,204,206,255:0.3883;153,219,184,255:0.445;153,219,184,255:0.445;192,229,136,255:0.5;192,229,136,255:0.5;204,230,75,255:0.555;204,230,75,255:0.555;243,240,29,255:0.6117;243,240,29,255:0.6117;254,222,39,255:0.6667;254,222,39,255:0.6667;252,199,7,255:0.7217;252,199,7,255:0.7217;248,157,14,255:0.7783;248,157,14,255:0.7783;245,114,21,255:0.8333;245,114,21,255:0.8333;241,71,28,255:0.8883;241,71,28,255:0.8883;219,30,38,255:0.945;219,30,38,255:0.945;164,38,44,255"/>
          </colorramp>
          <item value="21.7778" color="#1e5cb3" label="21.8" alpha="255"/>
          <item value="23.6481666666667" color="#0b8ed8" label="23.6" alpha="255"/>
          <item value="25.5185333333333" color="#66ccce" label="25.5" alpha="255"/>
          <item value="27.3889" color="#cce64b" label="27.4" alpha="112"/>
          <item value="29.2592666666667" color="#fede27" label="29.3" alpha="255"/>
          <item value="31.1296333333333" color="#f1471c" label="31.1" alpha="255"/>
          <item value="33" color="#a4262c" label="33" alpha="255"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation colorizeBlue="128" grayscaleMode="0" colorizeStrength="100" saturation="0" colorizeOn="0" colorizeRed="255" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
