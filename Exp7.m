fs=10000;
fc=3000;
N=[4,7,9];
Wc=fc/(fs/2);

figure;
hold on;

for n=N
    [b,a]=butter(n,Wc,'low');
    [H,f]=freqz(b,a,100,fs);
    plot(f,20*log10(abs(H)),'DisplayName',['Order = ' num2str(n)]);
end

hold off;

grid on;
title('Frequency response');
xlabel('Frequency');
ylabel('Magnitude(dB)');
ylim([-50,10]);
legend('show','Location','NorthEast');