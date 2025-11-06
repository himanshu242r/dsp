function X = fft(x)

N=length(x);

if log2(N) ~= floor(log2(N))
    error('Length of the inpute sequence must be a power of 2');
end

X=x;
X=bitrevorder(X);

step=2;
while step<=N
    half_step=step/2;
    for k=1:half_step
        twiddle=exp(-1j*2*pi*(k-1)/step);

        for n=1:step:N
            temp=X(n+k-1);
            X(n+k-1) = X(n+k-1) + twiddle*X(n+k+half_step-1);
            X(n+k+half_step-1) = temp - twiddle*X(n+k+half_step-1);
        end
    end
    step = step*2;
end
end

x=[1,2,2,1,1,0,0,0];
X=fft(x);
disp(X')
