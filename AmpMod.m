fm=input('Enter frequency of message signal,fm:');
fc=input('Enter frequency of carrier signal,fc:');
Am=input('Enter Amplitude of message signal,Am:');
Ac=input('Enter Amplitude of carrier signal,Ac:');
t=0:(1/(5*fc)):(50/fc);
msgsgl=Am.*sin(2*pi*fm*t);
carsgl=Ac.*sin(2*pi*fc*t);
subplot(5,1,1)
plot(t,msgsgl)
title("Tx-Message Sgl")
subplot(5,1,2)
plot(t,carsgl)
title("Tx-Carrier Sgl")
msgcare=(Ac+(Am.*sin(2*pi*fm*t))).*sin(2*pi*fc*t);
subplot(5,1,3)
title("Tx-AM Sgl")
plot(t,msgcare)
r=[];
for i=1:length(msgcare)
    if msgcare(i)>0
        r(i)=msgcare(i);
    else
        r(i)=0;
    end
end
y=[];
y=conv(r,h);
subplot(5,1,4)
plot(t,r)
title("Rx-Rectified Sgl")
subplot(5,1,5)
plot(y)
title("Rx-filtered message Sgl")
