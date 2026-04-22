# Fragility Functions

## Overview

This folder contains the seismic fragility functions for **18 building groups** representing low-rise masonry-infilled RC frame buildings (HAZUS C3 pre-code classification) in Chiang Mai, Thailand.

Fragility functions are expressed as lognormal cumulative distribution functions:

$$P(DS \geq ds_i \mid IM = x) = \Phi\left[\frac{\ln(x/\theta)}{\beta}\right]$$

where **θ** is the median IM capacity and **β** is the total log-standard deviation.

Parameters were estimated using Maximum Likelihood Estimation (MLE) applied to demand data from Multiple Stripe Analysis (MSA) with 35 ground motion stripes.

---

## Files

| File | Description |
|------|-------------|
| `fragility_groups.csv` | Definition of 18 fragility groups (occupancy type, stories, HAZUS class, representative models) |
| `fragility_parameters.csv` | Lognormal fragility parameters (θ, β) for all groups × 2 IMs × 4 damage states |

---

## Column Descriptions

### fragility_groups.csv

| Column | Description |
|--------|-------------|
| `group_id` | Group identifier (e.g., RES1-H1, COM-H2) |
| `occupancy_type` | Occupancy class: Single Family, Multifamily, Commercial, Office, Educational |
| `n_stories` | Number of stories |
| `hazus_class` | HAZUS sub-class: C3L (1–3 stories) or C3M (4–7 stories) |
| `n_models` | Number of representative building models in the group |
| `representative_model_ids` | Building model IDs used to derive group-level fragility |

### fragility_parameters.csv

| Column | Unit | Description |
|--------|------|-------------|
| `group_id` | — | Fragility group identifier |
| `imt` | — | Intensity measure type: `PGA` (g) or `SA(T1)` (g) |
| `damage_state` | — | Damage state: Slight, Moderate, Extensive, Complete |
| `theta` | g | Median IM capacity |
| `beta` | — | Total log-standard deviation (dispersion) |

---

## Fragility Groups

18 groups are defined by occupancy type and number of stories:

| Group ID | Occupancy | Stories | HAZUS Class | No. Models |
|----------|-----------|---------|-------------|------------|
| RES1-H1 | Single Family | 1 | C3L | 8 |
| RES1-H2 | Single Family | 2 | C3L | 8 |
| RES3-H1 | Multifamily | 1 | C3L | 4 |
| RES3-H2 | Multifamily | 2 | C3L | 4 |
| RES3-H3 | Multifamily | 3 | C3L | 4 |
| RES3-H4 | Multifamily | 4 | C3M | 4 |
| RES3-H5 | Multifamily | 5 | C3M | 4 |
| RES3-H7 | Multifamily | 7 | C3M | 4 |
| COM-H1 | Commercial | 1 | C3L | 4 |
| COM-H2 | Commercial | 2 | C3L | 4 |
| COM-H3 | Commercial | 3 | C3L | 4 |
| OFF-H1 | Office | 1 | C3L | 4 |
| OFF-H2 | Office | 2 | C3L | 4 |
| OFF-H3 | Office | 3 | C3L | 4 |
| EDU-H1 | Educational | 1 | C3L | 4 |
| EDU-H2 | Educational | 2 | C3L | 4 |
| EDU-H3 | Educational | 3 | C3L | 4 |
| EDU-H4 | Educational | 4 | C3M | 4 |

---

## Damage State Definitions

Damage states follow the HAZUS pre-code C3 classification, defined by inter-story drift ratio (IDR) thresholds:

| Damage State | Label | IDR Threshold C3L | IDR Threshold C3M |
|:---:|---|:---:|:---:|
| DS1 | Slight | 0.200% | 0.134% |
| DS2 | Moderate | 0.500% | 0.335% |
| DS3 | Extensive | 1.200% | 0.804% |
| DS4 | Complete | 2.800% | 1.876% |

---

## Intensity Measures

Two IMs are provided:

- **PGA** (Peak Ground Acceleration, in g): suitable for low-rise buildings and regional loss applications
- **SA(T1)** (Spectral Acceleration at fundamental period T1, in g): the primary IM used in the MSA/MLE analysis, providing lower dispersion for taller buildings

The fundamental period T1 for each building is recorded in `pushover_curves/modal_properties.csv` (mode 1x).

---

## Funding

This work was supported by the National Research Council of Thailand (NRCT), grant number N25A680575, under the project "Development of a catastrophe model for evaluating seismic losses and impacts in Chiang Mai and Chiang Rai."
