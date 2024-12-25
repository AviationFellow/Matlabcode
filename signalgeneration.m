%% 
t=-1:0.01:1;

%impulse sgl
impulse=t==0;
subplot(2,2,1)
plot(t,impulse)
title("Impulse Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,impulse)
title("Impulse Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

%unit step sgl
figure;
unitstep=t>=0;
subplot(2,2,1)
plot(t,unitstep)
title("Unit Step Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,unitstep)
title("Unit Step Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

%Ramp Sgl
figure;
ramp=t.*unitstep;
subplot(2,2,1)
plot(t,ramp)
title("Ramp Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,ramp)
title("Ramp Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

%Parabolic sgl
figure
para=(t.^2).*unitstep;
subplot(2,2,1)
plot(t,para)
title("Parabolic Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,para)
title("Parabolic Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

%Exponential
figure;
expo=exp(t);
subplot(2,2,1)
plot(t,expo)
title("Growing Exponential Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,expo)
title("Growing Exponential Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

expo=exp(-t);
subplot(2,2,3)
plot(t,expo)
title("Decaying Exponential Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,4)
stem(t,expo)
title("Decaying Exponential Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

%Sin and Cos sgl
figure;
s=sin(20*t);
subplot(2,2,1)
plot(t,s)
title("Sine Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,2)
stem(t,s)
title("Sine Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")

s=cos(20*t);
subplot(2,2,3)
plot(t,s)
title("Cosine Sgl CT")
xlabel("time(second)")
ylabel("Amplitude(V)")
subplot(2,2,4)
stem(t,s)
title("Cosine Sgl DT")
xlabel("time(second)")
ylabel("Amplitude(V)")