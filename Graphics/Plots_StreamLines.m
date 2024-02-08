function []=Plots_StreamLines(NEq,Code,Eq_pts,labels)
% clc;
close all;
syms x y z 
InputData;
%if StLines==1
[xdot_func, ydot_func, zdot_func, ~] = SymbolicFunctions(params_values);

% Define grid for evaluation
[x_vals, y_vals, z_vals] = meshgrid(x_range,y_range,z_range);

% Evaluate symbolic functions at the grid points
xdot_func_handle = matlabFunction(xdot_func, 'Vars', [x, y, z]);
ydot_func_handle = matlabFunction(ydot_func, 'Vars', [x, y, z]);
zdot_func_handle = matlabFunction(zdot_func, 'Vars', [x, y, z]);

u = xdot_func_handle(x_vals, y_vals, z_vals);
v = ydot_func_handle(x_vals, y_vals, z_vals);
w = zdot_func_handle(x_vals, y_vals, z_vals);
% Plot streamlines
[xs, ys, zs] = meshgrid(xmin:ds:xmax, ymin:ds:ymax, zmin:ds:zmax);
figure;
title('Stable EP(green), Unstable EP (red)');
xlabel('x');
ylabel('y');
zlabel('z');
axis([xmin xmax ymin ymax zmin zmax])
grid on;
hold on;
set(gca,'FontSize',24)
Plots_EqPts(NEq,Code,Eq_pts,labels) 
%legend(labels);
streamline(x_vals, y_vals, z_vals, u, v, w, xs(:), ys(:), zs(:));
%end
