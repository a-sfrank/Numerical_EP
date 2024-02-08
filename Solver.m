function [EPts,nEq] = Solver(xdot_func,ydot_func,zdot_func)
    InputData;

    % Preallocate memory for results_table
    results_table = zeros(length(x_range)*length(y_range)*length(z_range), 3);
    j = 0;

    % Loop through x, y, z ranges
    for x = x_range
        for y = y_range
            for z = z_range
                initial_guess = [x, y, z];
                options = optimoptions('fsolve', 'Display', 'off');
                solution = fsolve(@(vars) [xdot_func(vars(1), vars(2), vars(3)); ydot_func(vars(1), vars(2), vars(3)); zdot_func(vars(1), vars(2), vars(3))], initial_guess, options);

                % Check if the solution is in the positive x-y-z plane
                if all(solution >= 0)
                    % Check if a similar solution already exists in the results_table
                    is_duplicate = false;
                    for i = 1:j
                        existing_solution = results_table(i, :);
                        if norm(existing_solution - solution) < crit_val*10
                            is_duplicate = true;
                            break;
                        end
                    end

                    % If it's not a duplicate, tabulate the values
                    if ~is_duplicate
                        j = j + 1;
                        results_table(j, :) = solution;
                    end
                end
            end
        end
    end

    % Trim excess zeros from results_table
    results_table = results_table(1:j, :);

    % Identify equilibrium points (EPs)
    nEq = 0;
    EPts = zeros(size(results_table));
    for i = 1:size(results_table, 1)
        xval = results_table(i, 1);
        yval = results_table(i, 2);
        zval = results_table(i, 3);
        % Evaluate first derivative at the solution point
        xdotval = xdot_func(xval, yval, zval);
        ydotval = ydot_func(xval, yval, zval);
        zdotval = zdot_func(xval, yval, zval);

        % Exclude imaginary results and identify EPs
        if abs(round(imag(xval),5)) > 0
            % Exclude imaginary results
            results_table(i, :) = NaN;
        elseif (abs(xdotval) < crit_val && abs(ydotval) < crit_val && abs(zdotval) < crit_val)
            % Identify EPs
            nEq = nEq + 1;
            EPts(nEq, :) = results_table(i, :);
        end
    end

    % Trim excess zeros from EPts
    EPts = EPts(1:nEq, :);

    % Display the coordinates of equilibrium points
    disp('Equilibrium Points (coordinates- x,y,z):');
    disp(EPts);
end
