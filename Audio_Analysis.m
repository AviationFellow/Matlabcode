%audiorecorder(samplingfreq,bitsPerSample,noOfAudioChannel);
rec = audiorecorder(44100, 16, 1);

disp('Start recording...');
%pause(1);
%recordblocking(recorderObj,timeInSec)
recordblocking(rec, 8);
disp('Recording complete.');

% getaudiodata(audioObj)
audData = getaudiodata(rec);

t = (0:length(audData) - 1) / rec.SampleRate;
plot(t, audData);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Recorded Audio');


audDFT = fftshift(fft(audData));

fs=rec.SampleRate;
N=length(t);
nf=fs/N;
f = -fs/2:nf:fs/2-nf;
figure;

% magnitude spectrum
mag= abs(audDFT);
subplot(2,1,1)
stem(f,mag);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');

%phase spectrum
phas= angle(audDFT);
subplot(2,1,2)
stem(f,phas);
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Phase Spectrum');

%sound(5*audData, rec.SampleRate);
figure;
stem(f,mag);
