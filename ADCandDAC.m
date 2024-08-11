% % TRANSMITTER SIDE
% % Sampling
f=50;
vm=10;
t=0:(1/(50*f)):(5/f);
x=vm*sin(2*pi*f*t);
figure;subplot(4,1,1);stem(x);
title("Sampled Signal")

% % Quantization
xq=[];
L=16;
del=(2*vm)/L;
for j=1:length(x)
for i=1:L
    if (x(j)>=-vm+(del*(i-1)) & x(j)<=-vm+(del*(i)))
       xq(j)=i-1;
    end
end
end
subplot(4,1,2);stem(xq);
title("Quantized Signal")

% % Encoding
d=de2bi(xq);

d1=[];
for i=1:size(d,1)
d1=[d1 d(i,:)];
end

for j=1:length(d1)
    if d1(j)==1
       tr(j)=0.707;
    else
       tr(j)=-0.707;
    end
end        

% % Channel
SNR=10;
ch=awgn(tr,SNR);

% % Receiver side
s=[];
for j=1:length(ch)
    if ch(j)>=0
        s(j)=1;
    else
        s(j)=0;
    end
end

n=1;
for j=1:4:length(s)
    r1(n,:)=s(j:j+3);
    n=n+1;
end

r2=bi2de(r1);
subplot(4,1,3);stem(r2);
title("decoded signal")

xcap=conv(r2,h);
subplot(4,1,4);stem(xcap);
title("Filtered Signal")

figure;plot(x);
subplot(3,1,2)
plot(ch)
title("Channel")
subplot(3,1,1)
plot(d)
title("Digital Signal")
subplot(3,1,3)
hold on
plot(xcap);
title("Output")
