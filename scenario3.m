function dydt = plants_hare_lynx(t, y, a1, a2, b1, b2, d1, d2)
% Define parameters
period = 70;

% Calculate time modulo the period
t_mod = mod(t, period);

% Define differential equations
dydt = zeros(3, 1);
dydt(1) = y(1)*(1-y(1)) - ((a1*y(1)) / (1+b1*y(1)))*y(2);
dydt(2) = ((a1*y(1)) / (1+b1*y(1)))*y(2) - d1*y(2) - ((a2*y(2))/(1+b2*y(2)))*y(3);
dydt(3) = ((a2*y(2)) / (1+b2*y(2)))*y(3) - d2*y(3);
end

% Define time span for simulation
tspan = [0 200]; % Time span from 0 to 200 months

% Define initial conditions for populations
y0 = [1; 0.1; 8]; % Initial populations of plants, hares, and lynx

% Define parameters (adjusted for chaotic behavior)
a1 = 4.5; % Growth rate of hares (increased for chaotic behavior)
a2 = 0.1; % Growth rate of lynx (decreased for chaotic behavior)
b1 = 3; % Predation rate of hares on plants
b2 = 2; % Predation rate of lynx on hares
d1 = 0.4; % Death rate of hares
d2 = 0.01; % Death rate of lynx (increased for chaotic behavior)

% Solve the differential equations
[t, y] = ode45(@(t, y) plants_hare_lynx(t, y, a1, a2, b1, b2, d1, d2), tspan, y0);

% Plot the populations over time
figure("Name","plot population size in time")
plot(t, y(:, 1), 'r', t, y(:, 2), 'g', t, y(:, 3), 'b');
xlabel('Time (months)');
ylabel('Population');
legend('Plants', 'Hares', 'Lynxes');
title('Scenario3:population size in time ' );

figure("Name",'State space for Scenario 3')
plot(y(:,1),y(:,2));
title('State space')
xlabel('Hares');
ylabel('Lynxes');
colorbar;

% 3D plot state space
figure("Name","Plot state space for Scenario 3")
scatter3(y(:, 2), y(:, 3), y(:, 1), [], y(:, 1), 'filled');
xlabel('Hares');
ylabel('Lynxes');
zlabel('Plants');