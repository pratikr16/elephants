<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="1e+8" version="3.2.1-Bonn" hasScaleBasedVisibilityFlag="0">
  <pipe>
    <rasterrenderer opacity="1" type="singlebandpseudocolor" classificationMin="20" alphaBand="-1" band="1" classificationMax="40">
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
        <colorrampshader clip="1" classificationMode="2" colorRampType="INTERPOLATED">
          <colorramp type="gradient" name="[source]">
            <prop k="color1" v="242,236,188,255"/>
            <prop k="color2" v="0,42,168,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.095;242,236,188,255:0.111;243,232,182,255:0.127;243,228,175,255:0.143;243,223,168,255:0.159;242,219,161,255:0.175;242,215,155,255:0.19;242,210,149,255:0.206;243,206,144,255:0.222;243,201,139,255:0.238;244,196,134,255:0.254;244,192,130,255:0.27;244,187,125,255:0.286;244,182,122,255:0.302;245,177,119,255:0.317;245,172,116,255:0.333;245,167,113,255:0.349;245,162,110,255:0.365;245,157,108,255:0.381;245,152,107,255:0.397;245,146,106,255:0.413;244,141,105,255:0.429;244,136,104,255:0.444;243,130,103,255:0.46;243,125,103,255:0.476;241,120,104,255:0.492;240,114,105,255:0.508;239,109,105,255:0.524;237,104,106,255:0.54;236,98,107,255:0.556;234,93,108,255:0.571;231,87,110,255:0.587;229,82,112,255:0.603;226,77,113,255:0.619;224,71,115,255:0.635;221,65,117,255:0.651;217,61,119,255:0.667;213,56,122,255:0.683;209,52,124,255:0.698;205,47,127,255:0.714;200,42,129,255:0.73;196,37,131,255:0.746;190,35,134,255:0.762;184,32,137,255:0.778;178,30,139,255:0.794;172,27,142,255:0.81;166,25,145,255:0.825;159,25,147,255:0.841;151,26,149,255:0.857;143,27,152,255:0.873;134,29,154,255:0.889;125,30,156,255:0.905;116,31,159,255:0.921;105,33,160,255:0.937;92,36,162,255:0.952;79,38,163,255:0.968;63,39,165,255:0.984;41,41,166,255"/>
          </colorramp>
          <item alpha="255" value="20" color="#f2ecbc" label="20"/>
          <item alpha="255" value="25" color="#f4c183" label="25"/>
          <item alpha="255" value="30" color="#f06f69" label="30"/>
          <item alpha="255" value="35" color="#bd2287" label="35"/>
          <item alpha="255" value="40" color="#002aa8" label="40"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="30" brightness="0"/>
    <huesaturation colorizeBlue="98" colorizeOn="0" colorizeGreen="209" colorizeRed="98" grayscaleMode="0" colorizeStrength="100" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
