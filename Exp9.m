clc;
clear;
close all;

%% === 1. Define Inputs ===
x1 = [1 2 2 1]; % Example signal 1
x2 = [2 1 2 0]; % Example signal 2

%% === 2. Method 1: Using DFT and IDFT (Frequency Domain) ===
disp('--- Method 1: Using DFT/IDFT ---');

N = length(x1); % Length for convolution

% DFT of x1
X1 = zeros(1, N);
for k = 1:N
    for n = 1:N
        X1(k) = X1(k) + x1(n) * exp(-1i*2*pi*(k-1)*(n-1)/N);
    end
end

% DFT of x2
X2 = zeros(1, N);
for k = 1:N
    for n = 1:N
        X2(k) = X2(k) + x2(n) * exp(-1i*2*pi*(k-1)*(n-1)/N);
    end
end

% Multiply DFTs (frequency-domain multiplication)
X3 = X1 .* X2;

% IDFT of X3 to get circular convolution
x3 = zeros(1, N);
for n = 1:N
    for k = 1:N
        x3(n) = x3(n) + X3(k) * exp(1j * 2 * pi * (n-1) * (k-1) / N);
    end
    x3(n) = x3(n) / N; % Scale by 1/N for IDFT
end

% Display and verify the result
disp('Circular convolution result using DFT and IDFT:');
disp(real(x3)); % Displaying real part to remove negligible imaginary parts

%% === 3. Method 2: Using Direct Summation Formula (Time Domain) ===
disp('--- Method 2: Using Direct Formula ---');

% Length for circular convolution
N1 = length(x1);
N2 = length(x2);
N = max(N1, N2);

% Zero-pad signals to length N if necessary (harmless in this case)
x1_padded = [x1 zeros(1, N - N1)];
x2_padded = [x2 zeros(1, N - N2)];

% Initialize output array
Y = zeros(1, N);

% Circular convolution using the formula
for n = 1:N
    for k = 1:N
        % Circular indexing for x2
        index = mod(n - k, N) + 1;
        Y(n) = Y(n) + x1_padded(k) * x2_padded(index);
    end
end

% Display and verify the result
disp('Circular convolution result in time domain:');
disp(Y);