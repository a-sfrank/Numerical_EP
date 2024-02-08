% Code for numerical solution of equilibrium points (EP) in 3D systems
% Edit only the files in User_Defined directory: InputData.m & SymbolicFunctions
% Add paths to subdirectories
 rehash;
 disp('Deleting old files from User_Defined Directory');
 system('rm ./User_Defined/*');
 addSubdirectoriesToPath();
% Main running code
close all; 
% Prompt the user to enter the example number
example_number = input('Enter the example number to run: ');
% Check the example number and execute the corresponding file
switch example_number
    case 1
        disp('Running Example 1');
        system('cp ./Examples/InputData_ex1.m ./User_Defined/InputData.m');
        system('cp ./Examples/SymbolicFunctions_ex1.m ./User_Defined/SymbolicFunctions.m');
    case 2
        disp('Running Example 2');
        system('cp ./Examples/InputData_ex2.m ./User_Defined/InputData.m');
        system('cp ./Examples/SymbolicFunctions_ex2.m ./User_Defined/SymbolicFunctions.m');
    % case 3
    %     disp('Running Example 3...');
    %     system('cp ./Examples/InputData_ex3.m ./User_Defined/InputData.m');
    %     system('cp ./Examples/SymbolicFunctions_ex3.m ./User_Defined/SymbolicFunctions.m');
    otherwise
        disp('Invalid example number.');
end

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


