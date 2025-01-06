% Generate unseen input data
t_prime_k = (0:0.01:1).';  % Column vector for unseen input

% Compute true output for unseen data
y_prime_true = sin(2 * pi * t_prime_k);

% Construct the design matrix for unseen data
X_prime_poly = zeros(length(t_prime_k), M+1);  % Design matrix for unseen data
for j = 0:M
    X_prime_poly(:, j+1) = t_prime_k.^j; % Each column is t_k'^j
end

% Predict output using the learned model
y_prime_pred = X_prime_poly * W;

% Plot results
figure;

% Plot training data
plot(X, Y, 'o', 'DisplayName', 'Training Data (Noisy)'); hold on;

% Plot true function for unseen data
plot(t_prime_k, y_prime_true, 'LineWidth', 2, 'DisplayName', 'True sin(2\pi t)');

% Plot predicted function for unseen data
plot(t_prime_k, y_prime_pred, '--', 'LineWidth', 2, 'DisplayName', 'Learned Model');

% Add title, labels, legend
title('Evaluation of Learned Model on Unseen Data');
xlabel('t_k');
ylabel('y(t_k)');
legend show;
grid on;

% Comment on Results
disp('Comparison of the learned model and true function completed.');
