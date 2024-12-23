% Define the range for k
k = 0:0.01:1;

% Compute the sine values
y = sin(2 * pi * k);

% Set the noise variance (σ^2) and generate noise
sigma2 = 0; % Adjust this value as needed
noise = sqrt(sigma2) * randn(size(k)); % Gaussian noise with mean 0 and variance σ^2

% Add noise to the sine values
y_noisy = y + noise;

% Plot the original sine function and noisy signal
figure;
plot(k, y, 'LineWidth', 2, 'DisplayName', 'Original sin(2\pi k)');
hold on;
plot(k, y_noisy, 'LineWidth', 2, 'DisplayName', 'Noisy sin(2\pi k)');
hold off;

% Add title, labels, and legend
title('Plot of sin(2\pi k) with Gaussian Noise');
xlabel('k');
ylabel('sin(2\pi k)');
legend show;

% Grid for better visualization
grid on;
