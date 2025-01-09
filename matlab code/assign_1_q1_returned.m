clc;
clear all;

% Question 1
tk = 0:0.01:1;  % time interval
y = sin(2 * pi * tk);  % original signal

sigma2 = 0.4;
gaussian_noise = sqrt(sigma2) * randn(size(tk));

y_gaussian = y + gaussian_noise;

% Plot Data
figure;
plot(tk, y, 'LineWidth', 2, 'DisplayName', 'Original sin(2\pi k)');
hold on;
scatter(tk, y_gaussian, 'red', 'DisplayName', 'Noisy signal sin(2\pi k)+Nk');
hold off;
title('Plot of y and yk');
xlabel('k');
ylabel('sin(2\pi k)');
legend show;
grid on;