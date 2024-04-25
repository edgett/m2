timeX = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
tempY = [78, 77, 76, 76, 78, 84, 87, 90, 91, 90, 88, 85, 80];

% Choose the degree of the polynomial. Here, degree = 5 seems reasonable for good fit.
degree = 5;

% Fit the polynomial to the data
p = polyfit(timeX, tempY, degree);

% Generate a set of points for a smooth plot
timeX_fine = linspace(min(timeX), max(timeX), 300);

% Evaluate the polynomial at the points in timeX_fine
tempY_fine = polyval(p, timeX_fine);

% Plot the original data points
figure;
plot(timeX, tempY, 'bo', 'DisplayName', 'Original Data');

% Hold on to plot the polynomial interpolation
hold on;

% Plot the interpolating polynomial
plot(timeX_fine, tempY_fine, 'r-', 'DisplayName', 'Interpolating Polynomial');

% Add labels and legend
xlabel('Time (hours)');
ylabel('Temperature (°F)');
title('Temperature Variation Over Time');
legend('show');

% Turn grid on
grid on;
