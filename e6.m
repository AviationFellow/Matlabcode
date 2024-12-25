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
subplot(4,1,1)
plot(ms)
xlabel('Time')
ylabel('Amplitude')
title('MESSAGE SIGNAL')

%carrier signal
f=100;
t=linspace(0,1,5000);
c=3*sin(2*3.14*f*t);
subplot(4,1,2)
plot(t,c)
xlabel('Time')
ylabel('Amplitude')
title('CARRIER SIGNAL')

%modulated signal
for i=1:length(c)
    if ms(i)==1
        mod(i)=1.*c(i);
    else
        mod(i)=-1.*c(i);
    end
end
subplot(4,1,3)
plot(mod)
xlabel('Time')
ylabel('Amplitude')
title('MODULATED SIGNAL')

%Demodulation
demod= mod.*c;
y1=conv(demod,h2);

for i=1:length(y1)
    if(y1(i)>1.5)
        y(i)=1;
    else
        y(i)=0;
    end
end

figure
subplot(4,1,1)
plot(y1)
xlabel('Time')
ylabel('Amplitude')
title('LPF SIGNAL')

subplot(4,1,2)
plot(y)
xlabel('Time')
ylabel('Amplitude')
title('OUTPUT SIGNAL')