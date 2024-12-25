
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
c=sin(2*3.14*f*t);
subplot(4,1,2)
plot(t,c)
xlabel('Time')
ylabel('Amplitude')
title('CARRIER SIGNAL')

%modulated signal
for i=1:length(c)
    if ms(i)==1
        mod(i)=c(i);
    else
        mod(i)=0;
    end
end
%ms=m.*c
subplot(4,1,3)
plot(mod)
xlabel('Time')
ylabel('Amplitude')
title('MODULATED SIGNAL')

%demodulated signal
for snr=1:10
rs=awgn(mod,snr);
rs1=rs.*c;
for i=1:length(rs1)
    if rs1(i) >= 0.5
        dm(i)=1;
    else
        dm(i)=0;
    end
end
end

%through filter
dm2=conv(dm,h);

for i=1:length(dm2)
    if dm2(i)>0.2
        dm3(i)=1;
    else
        dm3(i)=0;
    end
end

%bit error rate
err(snr)=0;
for i=1:n
if m(i)==dm(i)
err(snr)=err(snr)+0;
else
err(snr)=err(snr)+1;
end
end
ber(snr)=err(snr)/n;

subplot(4,1,4)
plot(dm3)
xlabel('Time')
ylabel('Amplitude')
title('DEMODULATED SIGNAL')
figure
plot(err)

