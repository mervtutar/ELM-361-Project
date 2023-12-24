%Merve TUTAR 1901022050
fs =10^4; % Sampling frequency
ts = 1/fs; % Sampling time
t = 0:ts:(5/50-ts); % Time axis 

% the message signal m(t)
mt = sin(200*pi*t) + 5*cos(400*pi*t);
f_mt = fftshift(fft(mt)/length(mt)); %Fourier transform
f = linspace(-fs/2,fs/2,length(t)); % Frequency 

% the carrier signal 𝑐(𝑡)
ct = 10*cos(2*pi*2000*t);
%modulated signal y(t)
yt =(1+ 0.1.*mt) .* ct
f_yt = fftshift(fft(yt)/length(mt));%Fourier transform
figure(3);
plot(t,yt,'m');
xlabel('Time(s)');
ylabel('y(t)');
title('modulated signal=y(t)');
figure(4);
plot(f,abs(f_yt),'m');
xlabel('Frequency(Hz)');
ylabel('y(f)');
title('Spectrum of modulated signal=y(f)');
%demodulator
c2 = cos(pi*4000*t);
%e(t)
et = yt.*c2; % the input of the LPF
f_et = fftshift(fft(et)/length(mt));%Fourier transform
figure(5);
plot(t,et,'m');
xlabel('t(s)');
ylabel('e(t)');
title('signal at the input of the LPF= e(t) ');
figure(6);
plot(f,abs(f_et),'m');
xlabel('f(Hz)');
ylabel('e(f)');
title('spectrum of the input of the LPF = E(f)');