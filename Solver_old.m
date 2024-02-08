function [EPts,nEq] = Solver(xdot_func,ydot_func,zdot_func)
InputData;
% Initialize an empty table to store results
results_table = table([], [], [], 'VariableNames', {'x', 'y', 'z'});
j = 0;
for x = x_range
    for y = y_range
        for z = z_range
            % Solve for (x, y, z) using fsolve
            initial_guess = [x, y, z];
            options = optimoptions('fsolve', 'Display', 'off');
            solution = fsolve(@(vars) [xdot_func(vars(1), vars(2), vars(3)); ydot_func(vars(1), vars(2), vars(3)); zdot_func(vars(1), vars(2), vars(3))], initial_guess, options);
            %---- CHECKS-------------------------------
            % 1. Check if the solution is in the positive x-y-z plane
            if all(solution >= 0)
                % Check if a similar solution already exists in the results_table
                is_duplicate = false;
                for i = 1:size(results_table, 1)
                    existing_solution = table2array(results_table(i, 1:3));
                    if norm(existing_solution - solution) < crit_val*10
                        is_duplicate = true;
                        break;
                    end
                end
                % 2. If it's not a duplicate, tabulate the values
                if ~is_duplicate
                    j = j + 1;
                    row = table(solution(1), solution(2), solution(3), 'VariableNames', {'x', 'y', 'z'});
                    results_table = [results_table; row];
                end
            end
        end
    end
end


% Numerical values
 FSol = table2array(results_table);
% %--------------------------------------------------------------------------
% 3.Identifying equilibrium points (EPs)
% %--------------------------------------------------------------------------
nEq=0; 
for i=1:length(FSol(:,1))
    xval = FSol(i,1);
    yval = FSol(i,2);
    zval = FSol(i,3);
    % Evaluate first derivative at the solution point
    xdotval = xdot_func(xval, yval, zval);
    ydotval = ydot_func(xval, yval, zval);
    zdotval = zdot_func(xval, yval, zval);
% Exclude imaginary results
if abs(round(imag(xval),5)) > 0
    FSol(i,1) = NaN;
    FSol(i,2) = NaN;
    FSol(i,3) = NaN;
% Exclude EPs and plot them in different color
elseif (abs(xdotval) < crit_val && abs(ydotval) < crit_val && abs(zdotval) < crit_val)
    nEq=nEq+1;
    EPts(nEq,1)=xval;
    EPts(nEq,2)=yval;
    EPts(nEq,3)=zval;
%    [xval yval zval]
%    scatter3([xval],[yval],[zval], 'go', 'filled', 'MarkerFaceColor', 'r');
%    hold on;
end
end
% Display the coordinates of equilibrium points
        disp('Equilibrium Points (coordinates- x,y,z):');
        disp(EPts);
