init();
N=1024; %number of samples in time and freq domain
n=0:N-1; %index for freq domain.
T=3; %signal period
Ts=T/N %sample period
t=0:Ts:T-Ts;
ws = 2*pi/Ts
w1 = 8*2*pi;
w2 = 15*2*pi;
y = zeros(size(t));

y=10 + 5*sin(w1*t) + 16*sin(w2*t);

make_plot(t,y,'Input function','n','y');
fft_ifft(t,y,N);

Mwin = 128;
fft_hanning_ifft(t,y,N,Mwin);
