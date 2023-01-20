clear all;

% location of existing folder where data will be saved
FOLDER_LOCATION = 'YOUR LOCATION\data\';

% number of generated examples
DATASET_SIZE = 5;

% size of the x and y grid axis
GRID_X_SIZE = 8;
GRID_Y_SIZE = 8;

% show or hide figures?
show_figs = false

% requires 'TPFA.m' code
createPermeabilityAndTarget(FOLDER_LOCATION, DATASET_SIZE, GRID_X_SIZE, GRID_Y_SIZE, show_figs);



% location of folder where permeability maps, target maps are located and
% also where we will save the combined files
PERMEABILITY_LOCATION = 'YOUR LOCATION\8x8\permeability\';
TARGET_LOCATION = 'YOUR LOCATION\8x8\target\';
SAVE_LOCATION = 'YOUR LOCATION\data\';

% requires 'natsort.m' and 'natsortfiles.m' codes
tranformPermeabilityAndTargetTo1D(PERMEABILITY_LOCATION, TARGET_LOCATION, SAVE_LOCATION)