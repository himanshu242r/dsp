x=[1,2,3,4];
h=[7,8,9];
length_x=length(x);
length_h=length(h);
N=length_x + length_h -1;

h_flip=h(end:-1:1);

y=zeros(1,N);
for n=0:N-1
    for k=0:n
        if (k+1 <= length_x) && (n-k+1<=length_h)
            y(n+1) = y(n+1) + x(k+1)*h_flip(n-k+1);
        end
    end
end

disp('Cross corelation y[n] = ');
disp(y);