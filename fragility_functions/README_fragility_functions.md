# Fragility Functions

## Overview

This folder contains seismic fragility functions for **18 building groups** representing low-rise masonry-infilled RC frame buildings (HAZUS C3 pre-code classification) in Chiang Mai, Thailand.

Two intensity measures are provided:

- **PGA** — Peak Ground Acceleration (g)
- **SA(T1)** — Spectral Acceleration at the fundamental period of the building (g)

---

## Files

| File | Description |
|------|-------------|
| `fragility_groups.csv` | Definition of 18 fragility groups (occupancy type, stories, HAZUS class, representative models) |
| `fragility_parameters.csv` | Fragility parameters for all 18 groups × 2 IMs × 4 damage states |

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
| `Building Class` | — | Fragility group identifier |
| `Intensity Measure` | — | `PGA` (g) or `SA(T1)` (g) |
| `Median slight damage` | g | Median IM capacity at Slight damage state |
| `Logarithmic standard deviation slight` | — | Dispersion at Slight damage state |
| `Median moderate damage` | g | Median IM capacity at Moderate damage state |
| `Logarithmic standard deviation moderate` | — | Dispersion at Moderate damage state |
| `Median extensive damage` | g | Median IM capacity at Extensive damage state |
| `Logarithmic standard deviation extensive` | — | Dispersion at Extensive damage state |
| `Median complete damage` | g | Median IM capacity at Complete damage state |
| `Logarithmic standard deviation complete` | — | Dispersion at Complete damage state |

---

## Fragility Groups

18 groups defined by occupancy type and number of stories:

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

## Funding

This work was supported by the National Research Council of Thailand (NRCT), grant number N25A680575, under the project "Development of a catastrophe model for evaluating seismic losses and impacts in Chiang Mai and Chiang Rai."
