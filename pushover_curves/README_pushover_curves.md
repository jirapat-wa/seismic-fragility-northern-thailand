# Pushover Curves

## Overview
This folder contains idealized pushover backbone curves, damage state thresholds, and modal properties for **80 representative building models** in both X and Y directions.

All pushover analyses were conducted using nonlinear static analysis in Perform-3D. Buildings represent the range of low-rise masonry-infilled RC frame buildings (HAZUS C3 pre-code classification) in Chiang Mai, Thailand. The 80 models span 18 fragility groups defined by occupancy type and number of stories.

Damage states are defined based on inter-story drift ratio (IDR) thresholds from the HAZUS pre-code C3 classification (Table 3 of the paper), converted to roof displacement via the pushover curve of each individual building model.

---

## Files

| File | Description |
|------|-------------|
| `pushover_backbone.csv` | 5-point idealized backbone curves for all 80 buildings × 2 directions |
| `damage_state_thresholds.csv` | Roof displacement thresholds at DS1–DS4 for all 80 buildings × 2 directions |
| `modal_properties.csv` | Modal properties (period, mode shape, participation factors) for 4 modes per building |

---

## Column Descriptions

### pushover_backbone.csv

The idealized backbone is a 5-point force-deformation relationship derived from the cyclic pushover analysis of each building model. Points represent key behavioral transitions (infill cracking, peak strength, post-peak degradation, and residual plateau).

| Column | Unit | Description |
|--------|------|-------------|
| `building_id` | — | Building model identifier (e.g., RES1-01, COM-03) |
| `direction` | — | Loading direction: X or Y |
| `Xr1_m`–`Xr5_m` | m | Roof displacement at backbone points 1–5 |
| `Vb1_kN`–`Vb5_kN` | kN | Base shear at backbone points 1–5 |

### damage_state_thresholds.csv

Roof displacement thresholds corresponding to each HAZUS damage state, derived from the IDR-based thresholds and the nonlinear pushover response of each building model.

| Column | Unit | Description |
|--------|------|-------------|
| `building_id` | — | Building model identifier |
| `direction` | — | Loading direction: X or Y |
| `DS1_slight_m` | m | Roof displacement at Slight damage onset |
| `DS2_moderate_m` | m | Roof displacement at Moderate damage onset |
| `DS3_extensive_m` | m | Roof displacement at Extensive damage onset |
| `DS4_complete_m` | m | Roof displacement at Complete damage onset |

### modal_properties.csv

Modal properties of the equivalent nonlinear SDOF systems used in the UMRHA procedure. Four translational modes are included (1x, 2x, 1y, 2y).

| Column | Unit | Description |
|--------|------|-------------|
| `building_id` | — | Building model identifier |
| `mode` | — | Mode label: 1x, 2x, 1y, 2y |
| `period_s` | s | Natural period of vibration |
| `PhiRoof_X` | — | Roof translational mode shape component in X |
| `PhiRoof_Y` | — | Roof translational mode shape component in Y |
| `Ln_X` | kg | Modal excitation factor for X-direction ground motion |
| `Ln_Y` | kg | Modal excitation factor for Y-direction ground motion |
| `PF_X` | — | Modal participation factor for X-direction |
| `PF_Y` | — | Modal participation factor for Y-direction |
| `Alpha_X` | — | Effective modal mass ratio for X-direction |
| `Alpha_Y` | — | Effective modal mass ratio for Y-direction |

---

## Damage State Definitions

Damage states follow the HAZUS pre-code C3 classification (moment-resisting RC frame with unreinforced masonry infill walls). Two sub-classifications are applied based on building height:
- **C3L** (low-rise): 1–3 stories
- **C3M** (mid-rise): 4–7 stories

| Damage State | Label | IDR Threshold C3L | IDR Threshold C3M |
|:---:|---|:---:|:---:|
| DS1 | Slight | 0.200% | 0.134% |
| DS2 | Moderate | 0.500% | 0.335% |
| DS3 | Extensive | 1.200% | 0.804% |
| DS4 | Complete | 2.800% | 1.876% |

The roof displacement threshold for each damage state was established directly from the nonlinear pushover curve of each building model by identifying the roof displacement at which the critical inter-story drift first reaches the corresponding IDR threshold.

---

## Building Classification

The 80 models are grouped into 18 fragility classes by occupancy type and number of stories. See `fragility_functions/fragility_groups.csv` for the full classification table.

---

## Funding
This work was supported by the National Research Council of Thailand (NRCT), grant number N25A680575, under the project "Development of a catastrophe model for evaluating seismic losses and impacts in Chiang Mai and Chiang Rai."
