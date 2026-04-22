# Ground Motions

## Overview
This folder contains metadata for **350 ground motion records** used in the Multiple Stripe Analysis (MSA) of the study.

Ground motions were selected using the **Conditional Mean Spectrum (CMS)** approach at 5 conditioning periods (T = 0.2, 0.3, 0.4, 0.6, and 1.0 s), covering the range of fundamental periods of low-rise RC frame buildings in the study area. For each conditioning period, records were selected at 7 hazard return periods, forming **35 MSA stripes** of 10 records each.

> **Note on redistribution:** Ground motion waveforms sourced from PEER NGA-West2 cannot be redistributed directly. Users should download the original waveforms from [PEER NGA-West2](https://ngawest2.berkeley.edu/) using the NGA record IDs provided in `ground_motion_metadata.csv`. Three locally recorded waveforms (Chiang Mai 2022 and Tarlay 2011) are identified in the metadata and available upon request from the corresponding author.

---

## Files

| File | Description |
|------|-------------|
| `ground_motion_metadata.csv` | Full metadata for all 350 records including source, scaling, and stripe assignment |

---

## Metadata Fields

| Column | Description |
|--------|-------------|
| `record_no` | Sequential record number (1–350) |
| `gm_id` | Ground motion filename identifier (e.g., gm001) |
| `nickname` | Descriptive label combining CMS period, return period, and record number |
| `source_database` | `PEER NGA-West2` or `Local - Chiang Mai` |
| `redistribution` | Whether the waveform can be redistributed |
| `nga_record_id` | NGA-West2 record ID (numeric), or local station code for locally recorded events |
| `earthquake_name` | Event name |
| `year` | Year of event |
| `station_name` | Recording station |
| `mw` | Moment magnitude |
| `mechanism` | Fault mechanism |
| `rrup_km` | Rupture distance (km) |
| `vs30_mps` | Average shear-wave velocity in top 30 m (m/s) |
| `scale_factor` | Amplitude scale factor applied to match target CMS |
| `D5_75_s` | Significant duration D5–75 (s) |
| `D5_95_s` | Significant duration D5–95 (s) |
| `cms_period_s` | CMS conditioning period (s) |
| `return_period_yr` | Hazard return period (years) — defines the MSA stripe |

---

## MSA Stripe Summary

35 stripes total — 5 conditioning periods × 7 return periods × 10 records each.

| CMS Period (s) | Return Period (yr) | No. of Records | Stripe Label |
|:--------------:|:-----------------:|:--------------:|:-------------|
| 0.2 | 43 | 10 | CMS0.2s_43years |
| 0.2 | 100 | 10 | CMS0.2s_100years |
| 0.2 | 225 | 10 | CMS0.2s_225years |
| 0.2 | 475 | 10 | CMS0.2s_475years |
| 0.2 | 975 | 10 | CMS0.2s_975years |
| 0.2 | 2475 | 10 | CMS0.2s_2475years |
| 0.2 | 5000 | 10 | CMS0.2s_5000years |
| 0.3 | 43 | 10 | CMS0.3s_43years |
| 0.3 | 100 | 10 | CMS0.3s_100years |
| 0.3 | 225 | 10 | CMS0.3s_225years |
| 0.3 | 475 | 10 | CMS0.3s_475years |
| 0.3 | 975 | 10 | CMS0.3s_975years |
| 0.3 | 2475 | 10 | CMS0.3s_2475years |
| 0.3 | 5000 | 10 | CMS0.3s_5000years |
| 0.4 | 43 | 10 | CMS0.4s_43years |
| 0.4 | 100 | 10 | CMS0.4s_100years |
| 0.4 | 225 | 10 | CMS0.4s_225years |
| 0.4 | 475 | 10 | CMS0.4s_475years |
| 0.4 | 975 | 10 | CMS0.4s_975years |
| 0.4 | 2475 | 10 | CMS0.4s_2475years |
| 0.4 | 5000 | 10 | CMS0.4s_5000years |
| 0.6 | 43 | 10 | CMS0.6s_43years |
| 0.6 | 100 | 10 | CMS0.6s_100years |
| 0.6 | 225 | 10 | CMS0.6s_225years |
| 0.6 | 475 | 10 | CMS0.6s_475years |
| 0.6 | 975 | 10 | CMS0.6s_975years |
| 0.6 | 2475 | 10 | CMS0.6s_2475years |
| 0.6 | 5000 | 10 | CMS0.6s_5000years |
| 1.0 | 43 | 10 | CMS1s_43years |
| 1.0 | 100 | 10 | CMS1s_100years |
| 1.0 | 225 | 10 | CMS1s_225years |
| 1.0 | 475 | 10 | CMS1s_475years |
| 1.0 | 975 | 10 | CMS1s_975years |
| 1.0 | 2475 | 10 | CMS1s_2475years |
| 1.0 | 5000 | 10 | CMS1s_5000years |

**Total: 350 records across 35 stripes**

---

## Local Records

Three records in this dataset were not sourced from PEER NGA-West2 and are locally recorded:

| Record No. | Stripe | Event | Year | Station | Mw |
|:-----------:|--------|-------|:----:|---------|:--:|
| 11 | CMS0.2s_100years | Chiang Mai | 2022 | SANA | 4.1 |
| 220 | CMS0.6s_43years | Chiang Mai | 2022 | SANA | 4.1 |
| 270 | CMS0.6s_2475years | Tarlay | 2011 | MASE | 6.8 |

These records are available upon request from the corresponding author.

---

## Funding
This work was supported by the National Research Council of Thailand (NRCT), grant number N25A680575, under the project "Development of a catastrophe model for evaluating seismic losses and impacts in Chiang Mai and Chiang Rai."
