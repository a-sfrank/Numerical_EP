[![DOI](https://zenodo.org/badge/751763756.svg)](https://zenodo.org/doi/10.5281/zenodo.10609323)

Copyright (c) 2024 Anna-Simone Frank, Samuel Subbey, Andrea Pinke (DOI: 10.5281/zenodo.10609323)

If you use or adapt this code or parts of it, cite the following reference: 
* Anna-Simone Frank, Sam Subbey, Andrea Pinke. (2024). a-sfrank/Numerical_EP: v1.0.0 (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.10609323

Numerical_EP is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program. If not, see http://www.gnu.org/licenses/.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
For questions or support contact
 * Anna-Simone Frank (asfrank88@gmail.com) or
 * Sam Subbey (samuels@imr.no)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Download the code at:  https://github.com/a-sfrank/Numerical_EP/tree/v1.0.0 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# General information:

The code solves numerically for the equilibrium points (EPs) of a 3-dimensional Ordinary Differential Equation (ODE) model, calculates their stability and plots streamlines and time-series dynamics of the system. It is specifically suited for systems with several trivial equilibria, i.e., multi-stable systems. The equilibrium points calculations are restricted to the positive (>0) coordinate axes only. 

For illustration, this code implements two 3-D multi-stable systems.

* The first example system is an embedded toggle-switch model (ETSM) exhibiting tristability. Model equations and parameters are taken from the following article:
Wu, S., Zhou, T. & Tian, T. A robust method for designing multistable systems by embedding bistable subsystems. npj Syst Biol Appl 8, 10 (2022). https://doi.org/10.1038/s41540-022-00220-1

* The second example represents a bistable, 3-species marine food-web system (FWM) of the species zooplankton, capelin and cod.

# Included code files and their description:

Code files are separated into different categories:
* The main.m and demo.m files run the codes.
* [User_Defined] ONLY two files need to be adjusted manually by the user, namely InputData.m and SymbolicFunctions.m.
* [Computations] Codes in this category solve the Ode system and determine the equilibrium points and coordinates, as well as their stability using the Jacobian matrix and eigenvalues.
* [Graphics] This category encompasses all codes that are needed to plot dynamics and equilibrium points. 

The following table lists all codes and provides detailed descriptions:
|File names: | Description:|
|---|---|
|main.m| This is the main running code without specifying a particular example.|
|demo.m| Runs example 1 (ETSM) or 2 (FWM) by prompting you to specify numeric number ‘1’ or ‘2’.|
|InputData.m |Specify here conditions for the plots, numerical analyses (e.g., parameter space exploration range), initial conditions, time span integration period, number of total parameters, or discretization step for streamline plot.|
|SymbolicFunctions.m|File specifies the model to be analyzed and its parameter values. To use code on a different 3-D model, the functions in this file NEED to be adapted. The code also computes the derivatives of the system.  |
|CompDiffJac.m|Returns the derivatives of the system  equations and the Jacobian matrix.|
|Solver.m|Solves the ODE and determines the coordinates of the EP of the system numerically.|
|AnalysisJ.m|Calculates the Jacobian matrix of the system and determines the stability of the EPs by calculating their eigenvalues.|
|Plots.m|Displays the results from the stability analysis (via the Jacobian matrix) and plots streamlines (if StLines=1 set in InputData.m) and equilibrium points (if EqPoints=1 set in InputData.m) and trajectories of state variables (if StSpace=1 set in InputData.m). This code calls respectively the codes Plots_StreamLines.m, Plots_EqPts.m, and Plots_ODESystem.m, which plot the figures. |

## Example cases
For the two presented examples, we include two InputData_exN.m and two SymbolicFunctions_exN.m files, where N describes the number of case example (either N=1 for ETSM, or N=2 for the FWM). 
To run and distinguish both examples, run demo.m and specify the numeric number of the particular example you want to run.

# Setting Input parameters:
|File name:|Description:|
|---|---|
|InputData.m|Change and adapt input parameters in InputData.m file.|

# Code outputs:
|Output type:| Descriptions:|
|---|---|
|Figures|Figures of equilibrium points in state space, streamlines and dynamics are plotted alone or in combination dependent on the information in InputData.m. |
|Data|Eigenvalues, equilibrium point coordinates and their stability, number of equilibrium points.|

# How to run/use the code:
Perform the following steps:
1.	Define input parameters in InputData.m and specify the model to be analyzed in SymbolicFunctions.m.
2.	Run the main.m file. If several models are analyzed, create several versions of files in step 1, and run/adapt demo.m file.
3.	Save files and data.

# Outlook:
1. We will add more 3D examples.
2. The code will be extended to higher dimensions (>3D).
