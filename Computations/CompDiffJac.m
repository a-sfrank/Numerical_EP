% Returns the derivatives, and the jacobian
function [xdot_func,ydot_func,zdot_func,J_func]=CompDiffJac(xdot,ydot,zdot,params,param_values)
syms x y z 
% Calculate Jacobian
J = jacobian([xdot; ydot; zdot], [x, y, z]);
% Substitute syms
xdot_func = matlabFunction(subs(xdot, params, param_values));
ydot_func = matlabFunction(subs(ydot, params, param_values));
zdot_func = matlabFunction(subs(zdot, params, param_values));
J_func = matlabFunction(subs(J, params, param_values));