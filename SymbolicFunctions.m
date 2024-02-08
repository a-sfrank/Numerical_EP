function [xdot_func,ydot_func,zdot_func,J_func] = SymbolicFunctions(param_values)
syms x y z 

%SYSBiology
 syms  a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2
 
 params = [a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2];
 
 xdot=a1 + b1/((c1+y^3)*(d1+z^3)) -x;
 ydot=a2 + b2/((c2+x^3)*(d2+z^3)) -y;
 zdot=a3 + b3/(c3+(x+y)^3) -z;

% FWM
% syms K alpha0 alpha1 alpha2 alpha3 a1 a2 a3 beta11 beta12 beta21 beta22 beta31 beta33 k2 k3 c1 c2 c3 A
% 
% params = [K alpha0 alpha1 alpha2 alpha3 a1 a2 a3 beta11 beta12 beta21 beta22 beta31 beta33 k2 k3 c1 c2 c3 A];
% 
% xdot=((beta11*z)/(beta12*x+z)-alpha1*(beta21*y^k2)/(beta22^k2*y^k2+x^k2))*x-a1*x+c1;
% ydot=((beta21*x^k2)/(beta22^k2*y^k2+x^k2)+(beta31*z^k3)/(beta33^k3*y^k3+z^k3))*y-a2*y+c2;
% zdot=(alpha0*(1-z/K)*(z/A-1)-alpha2*(beta11*x)/(beta12*x+z)-alpha3*(beta31*y^k3)/(beta33^k3*y^k3+z^k3))*z-a3*z+c3;

%=========================================================================
% Do not edit below this line
%-------------------------------------------------------------------------
[xdot_func,ydot_func,zdot_func,J_func]=CompDiffJac(xdot,ydot,zdot,params,param_values);
end