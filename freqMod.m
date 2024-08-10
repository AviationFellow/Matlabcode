%For other details, refer my Linkedin post
%profile https://www.linkedin.com/pulse/frequency-modulation-demodulation-arumukam-ganes-moorthe-v-fabyc
fm=input('Enter frequency of message signal,fm:');
fc=input('Enter frequency of carrier signal,fc:');
Am=input('Enter Amplitude of message signal,Am:');
Ac=input('Enter Amplitude of carrier signal,Ac:');
Beta=input("Enter Beta value,β:");
t=0:(1/(100*fc)):(50/fc);
msgsgl=Am.*cos(2*pi*fm*t);
carsgl=Ac.*cos(2*pi*fc*t);
msgcare=Ac.*cos(2*pi*fc*t + Beta.*(Am.*sin(2*pi*fm*t)));
subplot(3,1,3)
plot(t,msgcare,'red')
title("Tx-FM sgl")
subplot(3,1,1)
plot(t,msgsgl,'blue')
title("Tx-Msg sgl")
subplot(3,1,2)
plot(t,carsgl,'black')
title("Tx-Carrier sgl")

di=diff(msgcare);
r=[];
for i=1:length(di)
    if di(i)>0
        r(i)=di(i);
    else
        r(i)=0;
    end
end
y=[];
figure;
subplot(3,1,1)
plot(di)
title("Rx-Diff sgl")
y=conv(r,h);
subplot(3,1,2)
plot(r)
title("Rx-Rectified sgl")
subplot(3,1,3)
plot(y)
title("Rx-Obtained msg sgl")
