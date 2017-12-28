function build_spheres_mni(coordinates, radius, label)

% Function builds spherical Regions of Interests (ROIs) in .mat and .img format 
% from list of MNI coordinates.

% Inputs:   coordinates, list of MNI coordinates (1 coordinate per row, separate column for x, y, z)
%                radius, radius of the sphere in .mm
%                 label, label for naming ROIs (e.g. "Power_consensus")
% Outputs:  .mat sphere ROIs in /mat/ directory
%           .img sphere ROIs in /img/ directory

% Requires: 
%           SPM12 Toolbox (http://www.fil.ion.ucl.ac.uk/spm/software/spm12/) 
%           MarsBaR Toolbox (http://marsbar.sourceforge.net/) 
%
% K Finc, Interdisciplinary Centre for Modern Technologies NCU, 
% Last update: 27/12/2017

% Makes and specifies /mat/ and /img/ directories for output .mat and .img files 
    mkdir('img/'); dir_img = 'img/';
    mkdir('mat/'); dir_mat = 'mat/';

% For each coordinate on the list:
for spherenumber = 1:length(coordinates(:,1))
    maximum = coordinates(spherenumber,1:3); % the centre of the sphere in mm in MNI space
    sphere_centre = maximum;
    sphere_radius = radius;
    sphere_roi = maroi_sphere(struct('centre', sphere_centre, 'radius', sphere_radius));

% Defining sphere label using coordinates
    coordsx = num2str(maximum(1));
    coordsy = num2str(maximum(2));
    coordsz = num2str(maximum(3));
    spherelabel = sprintf('%s_%s_%s', coordsx, coordsy, coordsz);

% save ROI as MarsBaR .mat file
    saveroi(sphere_roi, fullfile(dir_mat, sprintf('%03d_%s_%s_%dmm_roi.mat', spherenumber, label, spherelabel, radius)));
    
% Save as .img
    save_as_image(sphere_roi, fullfile(dir_img, sprintf('%03d_%s_%s_%dmm_roi.img', spherenumber, label, spherelabel, radius)));
end