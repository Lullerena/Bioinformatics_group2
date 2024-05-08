% Scenario 2: The lynx population goes extinct (population very close to zero) after a year, plants and hares stabilize within 120 months.

timespan = [0 200]; % Time span from 0 to 200 months

% Define initial conditions for populations
y0 = [1; 0.1; 1]; % Initial populations of plants, hares, and lynxes

function dydt = plants_hare_lynx(t, y)

% Parameters
a1 = 4; % Growth rate of hares
a2 = 0.6 ; % Growth rate of lynxes
b1 = 4; % Predation rate of hares on plants
b2 = 3; % Predation rate of lynxes on hares
d1 = 0.5; % Death rate of hares
d2 = 0.48; % Death rate of lynxes


% Differential equations
dydt = zeros(3, 1);
dydt(1) = y(1) * (1 - y(1)) - ((a1 * y(1)) / (1 + b1 * y(1))) * y(2);
dydt(2) = ((a1 * y(1)) / (1 + b1 * y(1))) * y(2) - d1 * y(2) - ((a2 * y(2)) / (1 + b2 * y(2))) * y(3);
dydt(3) = ((a2 * y(2)) / (1 + b2 * y(2))) * y(3) - d2 * y(3);

end



% Solve the differential equations
[t, y] = ode45(@plants_hare_lynx, timespan, y0);

% Plot the populations over time
figure("Name","plot population size in time  for Scenario 2")
plot(t, y(:, 1), 'r', t, y(:, 2), 'g', t, y(:, 3), 'b');
xlabel('Time (months)');
ylabel('Population');
legend('Plants', 'Hares', 'Lynxes');
title('Scenario3:population size in time ' );

figure("Name",'State space for Scenario 2')
plot(y(:,1),y(:,2));
title('State space')
xlabel('Hares');
ylabel('Lynxes');
colorbar;

% 3D plot state space
figure("Name","Plot state space for Scenario 2")
scatter3(y(:, 2), y(:, 3), y(:, 1), [], y(:, 1), 'filled');
xlabel('Hares');
ylabel('Lynxes');
zlabel('Plants');