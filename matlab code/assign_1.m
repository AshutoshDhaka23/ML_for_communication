% Define the range for k
k = 0:0.01:1;  %this is the time interval of measurement of the output 
 
% Compute the sine values
y = sin(2 * pi * k);

% Set the noise variance (σ^2) and generate noise
sigma2 = 0.2; % Adjust this value as needed
noise = sqrt(sigma2) * randn(size(k)); % Gaussian noise with mean 0 and variance σ^2

% Add noise to the sine values
y_noisy = y + noise;

%making the dataset 
X = k.';
Y = y_noisy.';
Y_clean = y.';
dataset_clean = [X,Y_clean];  % use to evaluate 
dataset = [X,Y];

%model parameters 
M =3;
eta = 0.3;
Liter = 3000;
L = length(X);


% Construct the design matrix for polynomial model
X_poly = zeros(L, M+1);  % Initialize the design matrix
for j = 0:M
    X_poly(:, j+1) = X.^j; % Each column is t_k^j
end

% weights 
W = rand(M+1, 1);  

%MSE 
MSE = zeros(Liter,1);

% Gradient descent iterations
for iter = 1:Liter
    % Compute predictions
    y_pred = X_poly * W;
    
    % Compute residuals
    error = y_pred - Y;
    
    % Compute gradient
    gradient = (1/L) * (X_poly.' * error);

    %compute MSE 
    MSE(iter)=mean(error.^2);
    
    % Update weights
    W = W - eta * gradient;
end

% Final polynomial model
y_fit = X_poly * W;

% Display the final weights
disp('Final weights (W):');
disp(W);

% Plot results
figure;
subplot(2,1,1);
plot(X, Y, '.', 'DisplayName', 'Noisy Data'); hold on;
plot(X, Y_clean, 'LineWidth', 2, 'DisplayName', 'Clean Data');
plot(X, y_fit, 'LineWidth', 2, 'DisplayName', 'Polynomial Fit');
title('Gradient Descent Polynomial Fit');
xlabel('t_k');
ylabel('y(t_k)');
legend show;
grid on;

% Plot MSE evolution
subplot(2, 1, 2);
plot(1:Liter, MSE, 'LineWidth', 2);
title('Mean Squared Error vs Iterations');
xlabel('Number of Iterations');
ylabel('Mean Squared Error');
grid on;


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
