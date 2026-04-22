% plot_pushover_check.m
% Verification plot: full pushover curve + idealized backbone + DS markers
%
% Layout: 2 subplots per building (X and Y direction)
% Navigation: Previous / Next buttons
%
% Notes:
%   - Units displayed in mm and kN for readability
%   - Backbone is extended by one extra point for plotting only
%     (at DS4 displacement if DS4 > Xr5, to avoid backbone ending before DS4 marker)

close all; clear; clc;

%% Load data
mat_folder = fullfile(pwd, '3.2 Plot Pushover to define pinching factor');
load(fullfile(mat_folder, 'Building.mat'));  % loads: Building
NoB = length(Building);
fprintf('Loaded %d buildings.\n', NoB);

%% Colors for DS markers
ds_colors = {[0.2 0.8 0.2], [1.0 0.7 0.0], [1.0 0.4 0.0], [0.8 0.0 0.0]};
ds_labels = {'DS1 Slight', 'DS2 Moderate', 'DS3 Extensive', 'DS4 Complete'};

%% Create figure
fig = figure('Name', 'Pushover Verification', 'NumberTitle', 'off', ...
             'Position', [100 100 1200 550]);
ax1 = subplot(1,2,1);
ax2 = subplot(1,2,2);

fig.UserData.Building  = Building;
fig.UserData.sel_BD    = 1;
fig.UserData.NoB       = NoB;
fig.UserData.ds_colors = ds_colors;
fig.UserData.ds_labels = ds_labels;

%% Navigation buttons
uicontrol(fig, 'Style', 'pushbutton', 'String', '<< Previous', ...
    'FontSize', 12, 'Position', [20 20 120 35], ...
    'Callback', @(s,e) navigate(fig, ax1, ax2, -1));

uicontrol(fig, 'Style', 'pushbutton', 'String', 'Next >>', ...
    'FontSize', 12, 'Position', [160 20 120 35], ...
    'Callback', @(s,e) navigate(fig, ax1, ax2, +1));

% Counter label
uicontrol(fig, 'Style', 'text', 'Tag', 'counter', ...
    'FontSize', 11, 'Position', [300 20 200 30], ...
    'HorizontalAlignment', 'left', ...
    'String', sprintf('Building 1 / %d', NoB));

%% Initial plot
updatePlot(fig, ax1, ax2);


%% ================================================================
%%  FUNCTIONS
%% ================================================================

function navigate(fig, ax1, ax2, step)
    fig.UserData.sel_BD = fig.UserData.sel_BD + step;
    fig.UserData.sel_BD = max(1, min(fig.UserData.sel_BD, fig.UserData.NoB));
    updatePlot(fig, ax1, ax2);
    % Update counter label
    h = findobj(fig, 'Tag', 'counter');
    h.String = sprintf('Building %d / %d', fig.UserData.sel_BD, fig.UserData.NoB);
end

function updatePlot(fig, ax1, ax2)
    BD         = fig.UserData.Building(fig.UserData.sel_BD);
    ds_colors  = fig.UserData.ds_colors;
    ds_labels  = fig.UserData.ds_labels;

    plotDirection(ax1, BD, 1, 'X', ds_colors, ds_labels);  % H1 = X
    plotDirection(ax2, BD, 2, 'Y', ds_colors, ds_labels);  % H2 = Y
end

function plotDirection(ax, BD, d, dir_label, ds_colors, ds_labels)
    cla(ax); hold(ax, 'on'); grid(ax, 'on');

    %% --- Data (convert to mm and kN) ---
    if d == 1
        Rd_full = BD.Rdx;           % mm
        Vb_full = BD.Vbx / 1000;   % kN
    else
        Rd_full = BD.Rdy;
        Vb_full = BD.Vby / 1000;
    end

    BB = BD.Backbone;
    DM = BD.Damage;

    % Backbone points (mm, kN)
    Xr = [BB.Xr1(d), BB.Xr2(d), BB.Xr3(d), BB.Xr4(d), BB.Xr5(d)];
    Vb = [BB.Vb1(d), BB.Vb2(d), BB.Vb3(d), BB.Vb4(d), BB.Vb5(d)] / 1000;

    % DS thresholds (mm)
    ds_vals = [DM.slight(d), DM.mod(d), DM.ext(d), DM.comp(d)];

    %% --- Extend backbone if DS4 > Xr5 (for plotting only) ---
    Xr_plot = Xr;
    Vb_plot = Vb;
    if ds_vals(4) > Xr(5)
        Xr_plot(end+1) = ds_vals(4);
        Vb_plot(end+1) = Vb(5);   % flat extension at last backbone strength
    end
    % Always add a small tail beyond the last point for visual clarity
    x_end = max(Xr_plot(end), ds_vals(4)) * 1.05;
    Xr_plot(end+1) = x_end;
    Vb_plot(end+1) = Vb_plot(end);

    %% --- Plot full pushover curve ---
    plot(ax, Rd_full, Vb_full, '-', 'Color', [0.6 0.6 0.6], ...
        'LineWidth', 2.5, 'DisplayName', 'Pushover curve');

    %% --- Plot idealized backbone ---
    Xr_bb = [0, Xr_plot];
    Vb_bb = [0, Vb_plot];
    plot(ax, Xr_bb, Vb_bb, '-o', 'Color', [0.8 0.0 0.0], ...
        'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', [0.8 0.0 0.0], ...
        'DisplayName', 'Idealized backbone');

    %% --- Plot DS vertical lines ---
    y_max = max([max(Vb_full), max(Vb_bb)]) * 1.1;
    for k = 1:4
        xline(ax, ds_vals(k), '--', 'Color', ds_colors{k}, ...
            'LineWidth', 1.8, 'Label', ds_labels{k}, ...
            'LabelVerticalAlignment', 'top', ...
            'LabelHorizontalAlignment', 'center', ...
            'FontSize', 8, 'DisplayName', ds_labels{k});
    end

    %% --- Formatting ---
    title(ax, sprintf('%s — %s direction', BD.Name, dir_label), ...
        'FontSize', 13, 'Interpreter', 'none');
    xlabel(ax, 'Roof Displacement (mm)', 'FontSize', 11);
    ylabel(ax, 'Base Shear (kN)', 'FontSize', 11);
    xlim(ax, [0, x_end * 1.05]);
    ylim(ax, [0, y_max]);
    legend(ax, {'Pushover curve', 'Idealized backbone', ...
        'DS1 Slight', 'DS2 Moderate', 'DS3 Extensive', 'DS4 Complete'}, ...
        'Location', 'northeast', 'FontSize', 8);
    hold(ax, 'off');
end
