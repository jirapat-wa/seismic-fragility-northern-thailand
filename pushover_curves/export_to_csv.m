% export_to_csv.m
% Export pushover backbone, damage state thresholds, and modal properties
% from Building.mat to CSV files for GitHub data repository.
%
% Units:
%   Input  - displacement: mm, base shear: N
%   Output - displacement: m,  base shear: kN
%
% Output files (saved to same folder as this script):
%   pushover_backbone.csv
%   damage_state_thresholds.csv
%   modal_properties.csv

close all; clear; clc;

%% Load Building.mat
mat_folder = fullfile(pwd, '3.2 Plot Pushover to define pinching factor');
load(fullfile(mat_folder, 'Building.mat'));  % loads variable: Building
NoB = length(Building);
fprintf('Loaded %d buildings.\n', NoB);

%% Define output folder
out_folder = pwd;

%% -------------------------------------------------------
%% 1. PUSHOVER BACKBONE (5 points per direction)
%% -------------------------------------------------------
fid1 = fopen(fullfile(out_folder, 'pushover_backbone.csv'), 'w');
fprintf(fid1, 'building_id,direction,Xr1_m,Xr2_m,Xr3_m,Xr4_m,Xr5_m,Vb1_kN,Vb2_kN,Vb3_kN,Vb4_kN,Vb5_kN\n');

for i = 1:NoB
    name = Building(i).Name;
    BB   = Building(i).Backbone;

    for d = 1:2  % d=1: X, d=2: Y
        if d == 1; dir_label = 'X'; else; dir_label = 'Y'; end

        Xr1 = BB.Xr1(d)/1000;  Xr2 = BB.Xr2(d)/1000;  Xr3 = BB.Xr3(d)/1000;
        Xr4 = BB.Xr4(d)/1000;  Xr5 = BB.Xr5(d)/1000;
        Vb1 = BB.Vb1(d)/1000;  Vb2 = BB.Vb2(d)/1000;  Vb3 = BB.Vb3(d)/1000;
        Vb4 = BB.Vb4(d)/1000;  Vb5 = BB.Vb5(d)/1000;

        fprintf(fid1, '%s,%s,%.6f,%.6f,%.6f,%.6f,%.6f,%.4f,%.4f,%.4f,%.4f,%.4f\n', ...
            name, dir_label, Xr1, Xr2, Xr3, Xr4, Xr5, Vb1, Vb2, Vb3, Vb4, Vb5);
    end
end
fclose(fid1);
fprintf('Saved: pushover_backbone.csv\n');

%% -------------------------------------------------------
%% 2. DAMAGE STATE THRESHOLDS
%% -------------------------------------------------------
fid2 = fopen(fullfile(out_folder, 'damage_state_thresholds.csv'), 'w');
fprintf(fid2, 'building_id,direction,DS1_slight_m,DS2_moderate_m,DS3_extensive_m,DS4_complete_m\n');

for i = 1:NoB
    name = Building(i).Name;
    DM   = Building(i).Damage;

    for d = 1:2
        if d == 1; dir_label = 'X'; else; dir_label = 'Y'; end

        ds1 = DM.slight(d)/1000;
        ds2 = DM.mod(d)/1000;
        ds3 = DM.ext(d)/1000;
        ds4 = DM.comp(d)/1000;

        fprintf(fid2, '%s,%s,%.6f,%.6f,%.6f,%.6f\n', ...
            name, dir_label, ds1, ds2, ds3, ds4);
    end
end
fclose(fid2);
fprintf('Saved: damage_state_thresholds.csv\n');

%% -------------------------------------------------------
%% 3. MODAL PROPERTIES (4 modes: 1x, 2x, 1y, 2y)
%% -------------------------------------------------------
fid3 = fopen(fullfile(out_folder, 'modal_properties.csv'), 'w');
fprintf(fid3, 'building_id,mode,period_s,PhiRoof_X,PhiRoof_Y,Ln_X,Ln_Y,PF_X,PF_Y,Alpha_X,Alpha_Y\n');

for i = 1:NoB
    name = Building(i).Name;
    MD   = Building(i).Modal;

    for m = 1:height(MD)
        mode_label = MD.Mode{m};
        T          = MD.Period(m);
        PhiR_H1    = MD.PhiRoof_H1(m);
        PhiR_H2    = MD.PhiRoof_H2(m);
        Ln_H1      = MD.Ln_H1(m);
        Ln_H2      = MD.Ln_H2(m);
        PF_H1      = MD.PF_H1(m);
        PF_H2      = MD.PF_H2(m);
        Al_H1      = MD.Alpha_H1(m);
        Al_H2      = MD.Alpha_H2(m);

        fprintf(fid3, '%s,%s,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n', ...
            name, mode_label, T, PhiR_H1, PhiR_H2, Ln_H1, Ln_H2, PF_H1, PF_H2, Al_H1, Al_H2);
    end
end
fclose(fid3);
fprintf('Saved: modal_properties.csv\n');

fprintf('\nDone! All 3 CSV files exported to:\n  %s\n', out_folder);
