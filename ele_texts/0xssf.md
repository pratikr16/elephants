---
title: "Elephant SSF"
date: "24/01/18"
geometry: margin=3cm
fontsize: 10pt
bibliography: ele-cite.bib
csl: ecology-letters.csl
header-includes:
 - \usepackage{tgtermes}
---

# Method

Environmental predictor values were extracted at all seven locations related to each movement segment in the data, which had been 'thinned' to select only positions six hours apart[^1]: one initial location (at time $t = n$), one 'used' location (at time $t = n+1$), and five control locations (which could have completed the segment $t = n$ --> $t = n+1$). The distance of control locations from initial locations was drawn from an exponential distribution fitted to step-lengths in the empirical data, and the relative angle between controls and initials was drawn from a von Mises distribution fitted to turning angles from the data [@forester2009accounting].
A conditional logistic regression was fitted with the use or not (1:use or 0:control) of each location as a response to the cosine of the relative angle between each location (control and used) and the initial location, and the interaction between distance to water and time of day, and the interaction between woody density and time of day.

$used \sim cos(relative.angle) + water:hour + woody density:hour$

# Results

All predictors, and all combinations of interactions were significant. The $R^2$ value was 0.011. Low $R^2$ values are apparently normal in this analysis. Figs. 1 and 2 show effects.

![Selection strength (black line) for distance to water at different hours of day. Zero represents no selection, a positive value indicates high selection, and a negative value shows avoidance. 95% confidence interval is shaded grey.](/home/pratik/git/elephants/ele_code/ssf_fig.png)

![Selection strength (black line) for woody density at different hours of day. Zero represents no selection, a positive value indicates high selection, and a negative value shows avoidance. 95% confidence interval is shaded grey.](/home/pratik/git/elephants/ele_code/ssf_fig_trees.png)

---

[^1]: Selecting positions too close together in time introduces significant autocorrelation, which is recommended to be resolved by selecting intervals approximately 5 - 10 times greater than the sampling interval.
