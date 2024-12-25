[audData, Fs] = audioread('C:File_Path','native');
% Compute the FFT
t = (0:length(audData) - 1) / Fs;
plot(t, audData);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Input Audio');

audDFT = fftshift(fft(audData));

N=length(t);
nf=Fs/N;
f = -Fs/2:nf:Fs/2-nf;
figure;

mag= abs(audDFT);
stem(f,mag,'b');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of input signal');

%sound(5*audData,Fs)

figure;
fop1=conv(h,audData(:,1));
fop2=conv(h,audData(:,2));
fop=[[fop1] [fop2]];

fopDFT = fftshift(fft(fop));
ff = [zeros(1,(length(h)-1)/2) (-Fs/2):nf:(Fs/2-nf) zeros(1,(length(h)-1)/2)];

magfop= abs(fopDFT);
stem(ff,magfop,'k');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of output signal');


cutoff_freq = 800;
[b, a] = butter(6, cutoff_freq / (Fs/2), 'low');

filtered_audio = filter(b, a, fop);
