
# Methods

## Elephant tracking and context data

We collected half-hourly positions of individual (n = 14) free-ranging female African elephants (*Loxodonta africana*) previously fitted with GPS logger-transmitter collars; each was from a different herd in Kruger National Park, South Africa (24°S, 31.5°E) (see Supplementary material Fig. A1). Elephants were tracked for on average 637 days (range: 436 -- 731) between August 2007 and August 2009. On-board thermochrons reported temperature data at each position fix. The value logged by each thermochron reflected a combination of the ambient temperature, elephant skin surface temperature, and the heat of operation of on-board electronics.

To relate elephant movement to their landscape, we gathered the following environmental data: courses of park rivers, locations of park waterholes, and enhanced vegetation index values [single snapshot, see @this_needs_changing] for the park as woody density. We placed this movement into the context of thermal landscapes by collecting half-hourly temperature data and daily rainfall data from Skukuza weather station (24.98°S, 31.5°E, see Supplementary material Fig. A2).

Elephant position data were filtered to exclude fixes with extreme temperatures (<15°C, >40°C, 1.74% data), leaving 279,612 fixes (98.26% data, Tab. 1). We further characterised the distance covered between each fix, and identified movements >100m as being from actively moving animals. Approximately half of the park's waterholes were active during the study period (n = 246, of 514), and we used only these locations in our analyses (Tab. 2).

## Analyses

We first examined whether collar-borne thermochron data accurately reported the thermal landscape of the park by testing its correlation with temperatures reported at the Skukuza weather station (see Supplementary material Fig. A2).

We characterised elephant movement in the hours preceding and following visits to limnal zones, and used fixes from moving animals to relate thermochron temperature (considered a proxy for elephant thermal condition), and elephant movement speed (distance covered between fixes) to elephant distance from water-sources. We then tested whether speed, and the magnitude of their movement relative to water (towards or away from) was related to elephant thermal condition. We tested for seasonal differences, and the effect of woody density in each case.

All analyses (see Supplementary material Tab. A1) included elephant identity as a random effect, and were implemented along with the movement characterisation in the `R` environment [@R] using the `move` [@move], `lme4` [@lme4], and `mgcv` [@wood2013gam] packages as relevant.
