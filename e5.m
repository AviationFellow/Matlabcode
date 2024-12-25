%message signal
n=50;
ms=[];
m=randi([0,1],1,n);
for b=1:n
if m(b)==1
ms=[ms ones(1,100)];
else
ms=[ms zeros(1,100)];
end
end
subplot(4,1,3)
plot(ms)
xlabel('Time')
ylabel('Amplitude')
title('MESSAGE SIGNAL')

%Carrier Generation
f1=100;
f2=200;
t=linspace(0,1,5000);
c1=sin(2*3.14*f1*t);
c2=sin(2*3.14*f2*t);
subplot(4,1,2)
plot(c1)
xlabel('Time')
ylabel('Amplitude')
title('Carrier 1')
subplot(4,1,1)
plot(c2)
xlabel('Time')
ylabel('Amplitude')
title('Carrier 2')

%FSK Modulation

for i=1:length(ms)
    if ms(i)==1
        mod(i)=c2(i);
    else
        mod(i)=c1(i);
    end
end
subplot(4,1,4)
plot(mod)
xlabel('Time')
ylabel('Amplitude')
title('MODULATED SIGNAL')

%demodulation
cosighigh=mod.*c2;
cosiglow=mod.*c1;
y1=conv(cosighigh,h1);
y2=conv(cosiglow,h2);

figure
subplot(4,1,1)
plot(y1)
xlabel('Time')
ylabel('Amplitude')
title('LPF1 SIGNAL')
subplot(4,1,2)
plot(y2)
xlabel('Time')
ylabel('Amplitude')
title('LPF2 SIGNAL')

for i=1:length(y1)
    if(y1(i)>0.4)
        y(i)=1;
    else
        y(i)=0;
    end
end
subplot(4,1,3)
plot(y)
xlabel('Time')
ylabel('Amplitude')
title('OUTPUT SIGNAL')