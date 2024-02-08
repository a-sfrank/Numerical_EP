%function []= Plots(J_func,Eq_pts,NEq,StLines,EqPoints)
function []= Plots(J_func,Eq_pts,NEq)
InputData;
% Display results from analysis of the Jacobian
        [~, ~,Code,labels] = AnalysisJ(J_func,Eq_pts);
% Plot Streamlines and equilibrium points
if StLines==1; Plots_StreamLines(NEq,Code,Eq_pts,labels); end
% Plot Equilibrium points only
if EqPoints==1
  figure; hold on;
  Plots_EqPts(NEq,Code,Eq_pts,labels); view(3);
  title('Green (stable EP), Red(unstable EP)');
  %legend(labels);
end
% Plot trajectory of state variables
if StSpace==1
    Plots_ODESystem; %(params_values, initial_conditions, tspan)
end
end
