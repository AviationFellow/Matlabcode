fs=1000;               
T=1;                  
t=0:1/fs:T;            
P=10;
f=50;                
s=sqrt(2*P)*sin(2*pi*f*t);
d=5;
expsig = exp(-d * t);
en_sgl = s.*expsig;

energy = sum(en_sgl.^2)/fs;

subplot(2,1,1);
plot(t,s);
title('Original Sine Wave (Power Signal)');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, en_sgl);
title('Energy Signal (Exponentially Decaying)');
xlabel('Time (seconds)');
ylabel('Amplitude');

disp(['Calculated Energy: ', num2str(energy), ' Joules']);
