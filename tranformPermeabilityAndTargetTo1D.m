function transformPermeabilityAndTargetTo1D(PERMEABILITY_LOCATION, TARGET_LOCATION, SAVE_LOCATION)
%transformPermeabilityAndTargetTo1D.m Transforms and combines generated
%permeability and target maps from 2D per file, to 1D and saves into a
%single .mat file. 
% Inputs:
%   PERMEABILITY_LOCATION   : location of folder where permeability maps
%   are stored
%   TARGET_LOCATION         : location of folder where target maps are
%   stored 
%   SAVE_LOCATION           : location, where combined files will be saved

% Read permeability files into a single 2d matrix, where a row represents a
% file
S = dir(fullfile(PERMEABILITY_LOCATION,'*_permeability-*.mat'));
S = natsortfiles(S); % alphanumeric sort by filename
for k = 1:numel(S)
    T = load(fullfile(PERMEABILITY_LOCATION,S(k).name));
    permeability_2d = T.permeability_map;
    permeability_1d = reshape(permeability_2d.',1,[]);
    S(k).data = permeability_1d;
end
permeability = vertcat(S.data);

% Read target files into a single 2d matrix, where a row represents a
% file
S = dir(fullfile(TARGET_LOCATION,'*_target-*.mat'));
S = natsortfiles(S); % alphanumeric sort by filename
for k = 1:numel(S)
    T = load(fullfile(TARGET_LOCATION,S(k).name));
    target_2d = T.P;
    target_1d = reshape(target_2d.',1,[]);
    S(k).data = target_1d;
end
target = vertcat(S.data);

[perm_grid_x, perm_grid_y] = size(permeability_2d);
[targ_grid_x, targ_grid_y] = size(target_2d);

save(append(SAVE_LOCATION, int2str(perm_grid_x), 'x', int2str(perm_grid_y), '_permeability.mat'),'permeability');
save(append(SAVE_LOCATION, int2str(targ_grid_x), 'x', int2str(targ_grid_y), '_target.mat'),'target');

