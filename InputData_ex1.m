%Figures
StLines=1;  % Set to 0/1 for plot of Streamlines around Eq. pts
EqPoints=0; % Set to 0/1 for plot of equilibrium points only
StSpace=0;  % Set to 0/1 for plot of State Vectors, given initial conditions

tspan=[0 1000]; % If StSpace=1, provide time interval for intergration of ODEs
% Set initial conditions or table of initial conditions for multiple runs
initial_conditions=[0.1 0.1 0.1;
                    0.9 0.2 0.3]; 

% Enter dimension of model parameters (used to check for conistency)
n_paras=11;
% Define model parameter values 
params_values  = [0.2 0.2 0.2 4 4 4 1 1 1 1 1]; 

% Define bounds for search space for equilibrium points
xminVal = 0.01; xmaxVal = 10;
yminVal = 0.01; ymaxVal = 10;
zminVal = 0.01; zmaxVal = 10;

% max discretization of search space
    nmax=50;

% Threshold (zero) of solution Df=0 for numerical solution
crit_val=1.0e-5;

% Streamline grid interval. Higher values may delay plots
    ds=1.5;
%======================================================
% Do not edit below this line
%------------------------------------------------------
LenParaValues=length(params_values);
disc=abs(n_paras-LenParaValues);

% Define bounds for search space
xmin = xminVal; xmax = xmaxVal;
ymin = yminVal; ymax = ymaxVal;
zmin = zminVal; zmax = zmaxVal;

% Set up a range for x, y, z
x_range = linspace(xmin, xmax, nmax);
y_range = linspace(ymin, ymax, nmax);
z_range = linspace(zmin, zmax, nmax);