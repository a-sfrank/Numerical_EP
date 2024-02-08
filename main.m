% Code for numerical solution of equilibrium points (EP) in 3D systems
% Edit only the files in User_Defined directory: InputData.m & SymbolicFunctions
% Add paths to subdirectories
 addSubdirectoriesToPath();
% Main running code
close all; 
InputData;

Nori=StLines+EqPoints;
if disc==0
    if Nori>0 
        [xdot_func,ydot_func,zdot_func,J_func] = SymbolicFunctions(params_values);
        [Eq_pts,NEq] = Solver(xdot_func,ydot_func,zdot_func);
        if NEq>0; Plots(J_func,Eq_pts,NEq); end
    else
        Plots_ODESystem;
    end
else
    error('%d (Expected) vs. %d (Provided) parameter values', n_paras, LenParaValues);
%        return;  % The program will terminate here
end
%----------------------------------------------------------------------
function addSubdirectoriesToPath()
    % Get the current directory
    currentFolder = pwd;

    % Generate the path string including subdirectories
    subdirectoriesPath = genpath(currentFolder);

    % Add the subdirectories to MATLAB's path
    addpath(subdirectoriesPath);

    disp(['Subdirectories in ', currentFolder, ' added to MATLAB path.']);
end


