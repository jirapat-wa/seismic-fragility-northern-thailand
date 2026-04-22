# Pushover Curves

## Overview
This folder contains pushover (capacity) curves and damage state thresholds for **80 archetype buildings** in both X and Y directions (160 curves total).

All pushover analyses were conducted using nonlinear static analysis in Perform-3D. Buildings represent the range of low-rise masonry-infilled RC frame buildings (HAZUS C3 type) in Chiang Mai, Thailand.

## Files

| File | Description |
|------|-------------|
| `pushover_curves.csv` | All 160 pushover curves in long format |
| `damage_state_thresholds.csv` | Roof displacement thresholds at 4 damage states for all buildings × directions |

## Column Descriptions

### pushover_curves.csv

| Column | Unit | Description |
|--------|------|-------------|
| `building_id` | — | Unique building archetype identifier (B001–B080) |
| `direction` | — | Loading direction: X or Y |
| `roof_displacement_m` | m | Roof displacement (control node) |
| `base_shear_kN` | kN | Total base shear |

### damage_state_thresholds.csv

| Column | Unit | Description |
|--------|------|-------------|
| `building_id` | — | Unique building archetype identifier |
| `direction` | — | Loading direction: X or Y |
| `DS1_slight_m` | m | Roof displacement at Slight damage onset |
| `DS2_moderate_m` | m | Roof displacement at Moderate damage onset |
| `DS3_extensive_m` | m | Roof displacement at Extensive damage onset |
| `DS4_complete_m` | m | Roof displacement at Complete damage onset |
| `DS1_note` to `DS4_note` | — | Physical description of each damage state |

## Damage State Definitions
Damage states follow HAZUS-MH definitions adapted for masonry-infilled RC frames:

| Damage State | Label | Description |
|---|---|---|
| DS1 | Slight | First cracking of masonry infill panels |
| DS2 | Moderate | Significant cracking; loss of infill in-plane capacity |
| DS3 | Extensive | Partial out-of-plane collapse of infill; minor structural damage |
| DS4 | Complete | Structural collapse or imminent collapse |
