% Define the dataset
X = tk.'; % Input data (column vector)
Y = y.';  % Output data (column vector)
dataset = [X, Y];

% Model parameters
Len = length(X);       % Number of data points
model_order = 3;       % Order of the polynomial model
eta = 0.3;             % Learning rate
Liter = 3000;          % Number of iterations

% Design matrix (phi(x))
design_matrix = zeros(Len, model_order+1);
for j = 0:model_order
    design_matrix(:, j+1) = X.^j;
end

% Initialize weights randomly
W = rand(model_order+1, 1);

% MSE storage
MSE = zeros(Liter, 1); 

% Training loop
for iter = 1:Liter
    for k = 1:Len
        % Prediction for k-th data point
        y_pred = design_matrix(k, :) * W;
        
        % Error for k-th data point
        error = Y(k) - y_pred;
        
        % Gradient computation
        gradient = -error * design_matrix(k, :)'; 
        
        % Weight update
        W = W - (eta * gradient);
    end
    
    % Compute MSE for the entire dataset
    y_pred_oneiter = design_matrix * W;
    MSE(iter) = mean((Y - y_pred_oneiter).^2);
end

% Plot MSE vs Iterations
figure;
plot(1:Liter, MSE, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Mean Squared Error (MSE)');
title('MSE vs Iterations');
grid on;

% Evaluate on unseen data (Question 3)
t_prime = 0:0.01:1;  % Unseen input data
T_prime = t_prime.'; 

% Construct the design matrix for unseen data
design_matrix_test = zeros(length(T_prime), model_order + 1);
for j = 0:model_order
    design_matrix_test(:, j+1) = T_prime.^j;
end

y_pred_test = design_matrix_test * W;
y_clean_test = sin(2 * pi * t_prime).';  % True sine wave for unseen data

% Plot model evaluation on unseen data
figure;
plot(T_prime, y_clean_test, 'LineWidth', 2, 'DisplayName', 'True sine wave (clean)');
hold on;
plot(T_prime, y_pred_test, 'LineWidth', 2, 'DisplayName', 'Predicted output');
scatter(X, Y, 'red', 'DisplayName', 'Training data');
xlabel('t_k');
ylabel('y_k');
title('Model Evaluation on Unseen Data');
legend;
grid on;
hold off;
