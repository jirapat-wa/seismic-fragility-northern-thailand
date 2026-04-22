# Fragility Functions

## Overview
This folder contains seismic fragility functions for **18 groups** of low-rise masonry-infilled RC frame buildings (HAZUS C3 type) in Chiang Mai, Thailand.

Fragility functions were derived using **Multiple Stripe Analysis (MSA)** + **Uncoupled Modal Response History Analysis (UMRHA)** + **Maximum Likelihood Estimation (MLE)** following the methodology of Jalayer et al. (2015).

Each group has fragility functions for **2 intensity measures** (PGA and Sa(T1)) × **4 damage states** = 8 fragility curves per group.

---

## Files

| File | Description |
|------|-------------|
| `fragility_groups.csv` | Definition of the 18 building groups (geometry, infill ratio, era) |
| `fragility_parameters.csv` | Lognormal parameters θ and β for all 18 groups × 2 IMs × 4 DS |
| `fragility_PGA.csv` | Scatter-point fragility curves vs. PGA (GEM format) |
| `fragility_Sa.csv` | Scatter-point fragility curves vs. Sa(T1) (GEM format) |

---

## Column Descriptions

### fragility_PGA.csv / fragility_Sa.csv (GEM-compatible scatter format)

| Column | Unit | Description |
|--------|------|-------------|
| `group_id` | — | Fragility group identifier (G01–G18) |
| `imt` | — | Intensity measure type: `PGA` or `Sa(T1)` |
| `iml` | g | Intensity measure level |
| `damage_state` | — | Damage state: DS1 (Slight), DS2 (Moderate), DS3 (Extensive), DS4 (Complete) |
| `poe` | — | Probability of exceedance of the damage state at this IML (0–1) |
| `theta` | g | Median of the lognormal fragility function |
| `beta` | — | Log-standard deviation (dispersion) |
| `n_buildings_in_group` | — | Number of archetype buildings contributing to this group |
| `notes` | — | Additional notes |

### fragility_parameters.csv (compact summary)

| Column | Unit | Description |
|--------|------|-------------|
| `group_id` | — | Fragility group identifier |
| `imt` | — | Intensity measure type |
| `damage_state` | — | Damage state label |
| `theta` | g | Median fragility parameter |
| `beta` | — | Dispersion parameter |
| `n_buildings_in_group` | — | Number of archetypes |
| `method` | — | Fitting method (MLE) |

---

## Damage State Definitions

| Damage State | Label | Physical Description |
|---|---|---|
| DS1 | Slight | First cracking of masonry infill panels |
| DS2 | Moderate | Significant cracking; reduction of infill in-plane stiffness |
| DS3 | Extensive | Partial out-of-plane collapse of infill; minor structural damage |
| DS4 | Complete | Structural collapse or imminent collapse |

---

## Intensity Measures

| IMT | Symbol | Period | Notes |
|-----|--------|--------|-------|
| Peak Ground Acceleration | PGA | — | Suitable for low-rise buildings |
| Spectral Acceleration | Sa(T1) | Median T1 per group | Better IM for dynamic response |

---

## How to Reproduce the Fragility Curves

Given θ (theta) and β (beta), the probability of exceedance at IM level *x* is:

```
PoE(DS | IM = x) = Φ[ ln(x/θ) / β ]
```

Where Φ is the standard normal CDF.

**MATLAB example:**
```matlab
theta = 0.182; beta = 0.521;
IM = 0:0.01:2.0;
PoE = normcdf(log(IM./theta) ./ beta);
plot(IM, PoE)
```

**Python example:**
```python
import numpy as np
from scipy.stats import norm
theta, beta = 0.182, 0.521
IM = np.linspace(0.01, 2.0, 200)
PoE = norm.cdf(np.log(IM / theta) / beta)
```

---

## Reference
Jalayer, F., Ebrahimian, H., Miano, A., Manfredi, G., & Sezen, H. (2017). Analytical fragility assessment using unscaled ground motion records. *Earthquake Engineering & Structural Dynamics*, 46(15), 2639–2663.
