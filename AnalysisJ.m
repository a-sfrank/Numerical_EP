function [Eig_values, stability,Code,labels] = AnalysisJ(J_func,P)
%function [Eig_values, stability] = AnalysisJ(J_func,P)
% Code=1/0 = Stable/Unstable
nP=length(P);
Code=zeros(nP,1);
% Initialize a cell array to store stability labels
labels = cell(nP, 1);
for j=1:nP
    x_val=P(j,1); y_val=P(j,2); z_val=P(j,3);
% Evaluate eigenvalues of the Jacobian at the equilibrium point
    Eig_values = eig(J_func(x_val,y_val,z_val));
% Determine stability based on eigenvalues
    % if all(real(Eig_values) < 0)
    %     stability = 'Stable';
    %     Code(j)      = 1;
    %     disp('Stable point:');
    % else
    %     stability = 'Unstable';
    %     Code(j)      = 0;
    %     disp('Unstable point:');
    % end    
 eigenvalues=Eig_values;

% Classification of equilibrium point
    disp(['Equilibrium Point ', num2str(j)]);
    disp('Eigenvalues:');
    disp(eigenvalues);
    % Classify equilibrium point
    if all(real(eigenvalues) < 0)
        disp('Stable Node');
        stability = 'Stable Node';
        Code(j)      = 0;
    elseif all(real(eigenvalues) > 0)
        disp('Unstable Node');
        stability = 'Unstable Node';
        Code(j)      = 1;
    elseif any(real(eigenvalues) > 0) && any(real(eigenvalues) < 0)
        disp('Saddle Point');
        stability = 'Saddle Point';
        Code(j)      = 2;
    elseif all(real(eigenvalues) < 0) && all(imag(eigenvalues) ~= 0)
        disp('Stable Focus');
        stability = 'Stable Focus';
        Code(j)      = 3;
    elseif all(real(eigenvalues) > 0) && all(imag(eigenvalues) ~= 0)
        disp('Unstable Focus');
        stability = 'Unstable Focus';
        Code(j)      = 4;
    elseif all(imag(eigenvalues) ~= 0) && all(real(eigenvalues) == 0)
        disp('Center');
        stability = 'Center';
        Code(j)      = 5;
    end
    labels{j} = stability;
end

