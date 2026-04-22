# Ground Motions

## Overview
This folder contains metadata for **700 ground motion records** (350 pairs × 2 horizontal components) used in the Multiple Stripe Analysis (MSA) of the study.

> **Note on redistribution:** Ground motion waveforms sourced from PEER NGA-West2 cannot be redistributed directly. The `records/` folder is a placeholder. Users should download the original waveforms from [PEER NGA-West2](https://ngawest2.berkeley.edu/) using the metadata provided in `ground_motion_metadata.csv`.

## Files

| File | Description |
|------|-------------|
| `ground_motion_metadata.csv` | Full metadata for all 700 records including source, scaling, and stripe assignment |
| `records/` | Placeholder folder for waveform files (.AT2 format) |

## Metadata Fields

| Column | Description |
|--------|-------------|
| `record_id` | Unique record pair identifier |
| `filename` | Waveform filename (.AT2) |
| `source_database` | Original database (e.g., PEER NGA-West2) |
| `earthquake_name` | Event name |
| `year` | Year of event |
| `station_name` | Recording station |
| `Mw` | Moment magnitude |
| `Rjb_km` | Joyner-Boore distance (km) |
| `Vs30_mps` | Average shear-wave velocity in top 30m (m/s) |
| `component` | Ground motion component (H1 or H2) |
| `scale_factor` | Amplitude scale factor applied |
| `dt_s` | Time step (seconds) |
| `npts` | Number of time steps |
| `PGA_g` | Peak Ground Acceleration (g) after scaling |
| `Sa_T1_g` | Spectral acceleration at fundamental period T1 (g) after scaling |
| `stripe_IM_level` | Target IM level for this stripe |
| `stripe_index` | Stripe number (1 to N) |
| `notes` | Any additional notes |

## MSA Stripe Summary

| Stripe | Target IM Level | No. of Pairs |
|--------|----------------|--------------|
| 1 | 0.10g | 50 |
| 2 | 0.20g | 50 |
| 3 | (fill in) | 50 |
| ... | ... | ... |
| 7 | (fill in) | 50 |

**Total: 350 pairs / 700 records**
