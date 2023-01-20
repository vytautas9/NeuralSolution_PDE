function createPermeabilityAndTarget(FOLDER_LOCATION, DATASET_SIZE, GRID_X_SIZE, GRID_Y_SIZE, show_figs)
%createPermeabilityAndTarget.m Generates [DATASET_SIZE] number of
%permeability and corresponding TPFA solutions with grid size [GRID_X_SIZE,
%GRID_Y_SIZE, 1]. Saves those examples to [FOLDER_LOCATION], for each
%example 1 permeability .mat and target .mat files will be saved.
% Inputs:
%   FOLDER_LOCATION : location of existing folder where data will be saved
%   DATASET_SIZE    : number of generated examples
%   GRID_X_SIZE     : size of the x grid axis
%   GRID_Y_SIZE     : size of the y grid axis
%   show_figs       : boolean, 'true' to show maps, 'false' to not show

for for_loop = 1:DATASET_SIZE
    close all;

    Grid.Nx=GRID_X_SIZE; Grid.hx=1/Grid.Nx;
    Grid.Ny=GRID_Y_SIZE; Grid.hy=1/Grid.Ny;
    Grid.Nz=1;  Grid.hz=1/Grid.Nz;
    Grid.K=exp(5*smooth3(smooth3(randn(4,Grid.Nx,Grid.Ny))));

    grid_size = strcat(strcat(int2str(Grid.Nx),'x'), int2str(Grid.Ny))
    permeability_file_name = append(grid_size, '_permeability-', int2str(for_loop), '.mat')
    target_file_name = append(grid_size, '_target-', int2str(for_loop), '.mat')

    % create a folder to group by grid size
    if ~exist(append(FOLDER_LOCATION, grid_size), 'dir')
        mkdir(append(FOLDER_LOCATION, grid_size))
        mkdir(append(FOLDER_LOCATION, grid_size, '\', 'permeability'))
        mkdir(append(FOLDER_LOCATION, grid_size, '\', 'target'))
    end
    permeability_file_location = append(FOLDER_LOCATION, grid_size, '\permeability\',  permeability_file_name)
    target_file_location = append(FOLDER_LOCATION, grid_size, '\target\',  target_file_name)

    if show_figs == true
        figure(1);
        pcolor(log10(squeeze(Grid.K(1,:,:)))); shading flat; axis square;
        colorbar; title('log10(K)');
    end

    % save the permeability map
    permeability_map = squeeze(Grid.K(1,:,:));
    save(permeability_file_location,'permeability_map');

    N=Grid.Nx*Grid.Ny*Grid.Nz;
    q=zeros(N,1); q([1 N])=[1 -1];
    P=TPFA(Grid,Grid.K,q);

    if show_figs == true
        figure(2);
        contourf(P,20); axis square;
        colorbar; title('Pressure');
    end

    % save the TPFA solution
    save(target_file_location,'P');
end