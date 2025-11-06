close all;
clear;

wc = 0.5 * pi;  % Cutoff frequency (radians)
n = 30;          % Filter order

w = 0:0.01:pi;  % Frequency vector

figure;

% --- LOW PASS FILTER ---

% Hamming window Low Pass Filter
b_low_ham = fir1(n, wc/pi, 'low', hamming(n+1));
H_low_ham = freqz(b_low_ham, 1, w);

% Rectangular window Low Pass Filter
b_low_rec = fir1(n, wc/pi, 'low', boxcar(n+1));
H_low_rec = freqz(b_low_rec, 1, w);

subplot(2,1,1);
plot(w/pi, abs(H_low_ham), 'LineWidth', 1.5);
hold on;
plot(w/pi, abs(H_low_rec), 'LineWidth', 1.5);
hold off;
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('|H(w)|');
title('Low Pass FIR Filter Frequency Response');
legend('Hamming', 'Rectangular');
%ylim([0,1.2]);
grid on;

% --- HIGH PASS FILTER ---

% Hamming window High Pass Filter
b_high_ham = fir1(n, wc/pi, 'high', hamming(n+1));
H_high_ham = freqz(b_high_ham, 1, w);

% Rectangular window High Pass Filter
b_high_rec = fir1(n, wc/pi, 'high', boxcar(n+1));
H_high_rec = freqz(b_high_rec, 1, w);

subplot(2,1,2);
plot(w/pi, abs(H_high_ham), 'LineWidth', 1.5);
hold on;
plot(w/pi, abs(H_high_rec), 'LineWidth', 1.5);
hold off;
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('|H(w)|');
title('High Pass FIR Filter Frequency Response');
legend('Hamming', 'Rectangular');
%ylim([0,1.2]);
grid on;
