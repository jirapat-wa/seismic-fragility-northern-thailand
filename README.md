# Seismic Fragility Functions for Low-Rise Masonry-Infilled RC Buildings in Northern Thailand

This repository contains the data supporting the paper:

> **"Development of City-Scale Seismic Fragility Functions of Low-Rise Masonry-Infilled RC Buildings in Northern Thailand"**  
> submitted to *Earthquake Spectra*

The study develops seismic fragility functions for 18 building groups in Chiang Mai, Thailand, using Multiple Stripe Analysis (MSA) with the Uncoupled Modal Response History Analysis (UMRHA) procedure and Maximum Likelihood Estimation (MLE).

---

## Repository Structure

```
├── ground_motions/
│   ├── ground_motion_metadata.csv     # Metadata for 350 ground motion records (35 stripes)
│   └── README_ground_motions.md
│
├── pushover_curves/
│   ├── pushover_backbone.csv          # 5-point idealized backbone curves (80 buildings × 2 directions)
│   ├── damage_state_thresholds.csv    # DS1–DS4 roof displacement thresholds (80 buildings × 2 directions)
│   ├── modal_properties.csv           # Modal properties for UMRHA (4 modes per building)
│   └── README_pushover_curves.md
│
└── fragility_functions/
    ├── fragility_groups.csv           # Definition of 18 fragility groups
    ├── fragility_parameters.csv       # Lognormal θ and β for all groups × 2 IMs × 4 damage states
    └── README_fragility_functions.md
```

---

## Building Inventory

**80 representative building models** spanning 18 fragility groups, classified by occupancy type and number of stories. All buildings represent the HAZUS C3 pre-code building type (masonry-infilled RC frame, pre-1975 design) typical of Chiang Mai's urban stock.

| Occupancy | Groups | Stories | HAZUS Class |
|-----------|--------|---------|-------------|
| Single Family (RES1) | 2 | 1–2 | C3L |
| Multifamily (RES3) | 6 | 1–7 | C3L / C3M |
| Commercial (COM) | 3 | 1–3 | C3L |
| Office (OFF) | 3 | 1–3 | C3L |
| Educational (EDU) | 4 | 1–4 | C3L / C3M |

See [`fragility_functions/fragility_groups.csv`](fragility_functions/fragility_groups.csv) for the full classification.

---

## Methodology Summary

1. **Ground Motions** — 350 records in 35 stripes (5 Conditional Mean Spectrum target periods × 7 return periods: 43–5000 years), selected from PEER NGA-West2 and locally recorded events.

2. **Structural Analysis** — Nonlinear static (pushover) analyses in Perform-3D. Seismic demands computed via UMRHA, converting multi-mode spectral demand to roof displacement for each record.

3. **Damage Assessment** — HAZUS pre-code C3L/C3M inter-story drift ratio thresholds (DS1 Slight through DS4 Complete) applied to each building's pushover curve.

4. **Fragility Fitting** — MLE applied to the MSA demand data to fit lognormal fragility parameters (θ, β) for each group × IM × damage state combination.

---

## Ground Motion Records

Ground motion time series are **not included** in this repository. PEER NGA-West2 records (347 of 350) can be downloaded from the [PEER Ground Motion Database](https://ngawest2.berkeley.edu/) using the `nga_record_id` provided in `ground_motion_metadata.csv`. The 3 locally recorded events are available upon request.

---

## Citation

If you use this data, please cite the associated paper (details to be updated upon acceptance).

---

## Funding

This work was supported by the National Research Council of Thailand (NRCT), grant number N25A680575, under the project "Development of a catastrophe model for evaluating seismic losses and impacts in Chiang Mai and Chiang Rai."
