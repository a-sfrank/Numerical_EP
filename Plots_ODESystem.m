function [] = Plots_ODESystem
    InputData; 
    [nrowIC,~]=size(initial_conditions);

    % Define symbolic functions
    [xdot_func,ydot_func,zdot_func,~] = SymbolicFunctions(params_values);
    % Check the type and content of symbolic expressions
    %disp(class(xdot_func));
    %disp(xdot_func);  
% Convert 
    % Convert functional handles (xdot_func, ydot_func, and zdot_func) to
    % symbolic functions to MATLAB functions
    xdot = @(x, y, z) xdot_func(x, y, z);
    ydot = @(x, y, z) ydot_func(x, y, z);
    zdot = @(x, y, z) zdot_func(x, y, z);

    % Define ODE system
    odefun = @(t, Y) [xdot(Y(1), Y(2), Y(3)); ydot(Y(1), Y(2), Y(3)); zdot(Y(1), Y(2), Y(3))];
    
    for j=1:nrowIC
    % Solve ODE
        initcond=initial_conditions(j,:);
        [t, Y] = ode45(odefun, tspan, initcond);
    % Plot results
        figure;
        subplot(1,2,1)
        plot(t, Y(:, 1), 'r', t, Y(:, 2), 'g', t, Y(:, 3), 'b');
        xlabel('Time');
        ylabel('Population');
        legend('x', 'y', 'z');
        title('ODE System Solution');
        grid on;

        subplot(1,2,2)
        plot3(Y(:, 1),Y(:, 2),Y(:, 3));
        xlabel('x'); ylabel('y'); zlabel('z')
        ylabel('Population');
        title('ODE System Solution - 3D');
        grid on;
    end
end

