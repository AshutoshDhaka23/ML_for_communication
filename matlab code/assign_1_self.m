% Exercise 1: Section 1

clc;
clear all;

% Parameters
tk = 0:0.01:1;  % Regular time interval
y = sin(2 * pi * tk);  % Original signal

% Uniform sampling and noise (Question 2)
L = 100;  % Length of the dataset
tk_uniform = sort(rand(L, 1));  % Uniformly sampled t_k in [0, 1]
gaussian_noise = sqrt(0.09) * randn(size(tk_uniform));  % Noise with σ^2 = 0.09
y_uniform_noisy = sin(2 * pi * tk_uniform) + gaussian_noise;

% Plot uniform sampling
figure;
scatter(tk_uniform, y_uniform_noisy, 'r', 'DisplayName', 'Noisy samples');
hold on;
plot(tk, y, 'LineWidth', 2, 'DisplayName', 'True signal');
hold off;
title('Uniformly Sampled Noisy Signal');
xlabel('t_k');
ylabel('y_k');
legend show;
grid on;

% Higher noise variance (Question 3)
gaussian_noise_high = sqrt(0.4) * randn(size(tk_uniform));  % Noise with σ^2 = 0.4
y_uniform_noisy_high = sin(2 * pi * tk_uniform) + gaussian_noise_high;

% Plot for different noise variances
figure;
scatter(tk_uniform, y_uniform_noisy, 'b', 'DisplayName', 'σ^2 = 0.09');
hold on;
scatter(tk_uniform, y_uniform_noisy_high, 'r', 'DisplayName', 'σ^2 = 0.4');
plot(tk, y, 'LineWidth', 2, 'DisplayName', 'True signal');
hold off;
title('Effect of Noise Variance');
xlabel('t_k');
ylabel('y_k');
legend show;
grid on;

% Instructions:
% Modify `sigma2` for noise variance in `sqrt(sigma2)` where required.
% Adjust L to experiment with dataset sizes for uniform sampling.
