timeX = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
tempY = [78, 77, 76, 76, 78, 84, 87, 90, 91, 90, 88, 85, 80];

% Define a function for Lagrange interpolation
function P = lagrange(x, y, x0)
    n = length(x);
    P = 0;
    for i = 1:n
        L = 1;
        for j = 1:n
            if i ~= j
                L = L * (x0 - x(j)) / (x(i) - x(j));
            end
        end
        P = P + y(i) * L;
    end
end

% Create a finer grid for plotting
timeX_fine = linspace(min(timeX), max(timeX), 300);

% Evaluate the Lagrange polynomial at each point in the fine grid
tempY_fine = arrayfun(@(x) lagrange(timeX, tempY, x), timeX_fine);

% Plot the original data and the interpolating polynomial
figure;
plot(timeX, tempY, 'bo', 'DisplayName', 'Original Data'); % plot original data points
hold on;
plot(timeX_fine, tempY_fine, 'r-', 'DisplayName', 'Lagrange Polynomial'); % plot interpolating polynomial

% Add plot labels and legend
xlabel('Time (hours)');
ylabel('Temperature (°F)');
title('Temperature Variation Over Time with Lagrange Interpolation');
legend('show');
grid on;
