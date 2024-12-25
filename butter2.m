ts=input("Enter the Sampling frequency: ");
dels=0.10;
delp=0.8;
wp=0.3*pi;
ws=0.5*pi;
ohmpass=(2/ts)*tan((wp)/2);
ohmstop=(2/ts)*tan((ws)/2);

N=0.5*(log(((1/dels^2)-1)/((1/delp^2)-1)))/(log(ohmstop/ohmpass));
N=ceil(N);

ohmcutoff=ohmpass/((1/delp^2)-1)^(1/(2*N));
b=[];
for k=1:(N/2)
    b(k)=2*sin(((2*k-1)*pi)/(2*N)); 
end
H=1;
for k=1:N/2
        numer=ohmcutoff^2;
        mid=b(k)*ohmcutoff;
        demon=[1 mid numer];
        H=H*tf(numer,demon);
    end
if (mod(N,2)==1)
    H=H*tf(ohmcutoff,[1 ohmcutoff]);
end

bode(H)
[zero, pole, k] = zpkdata(H, 'v');
figure;
zplane(zero, pole); 
xlabel('H - Real Part');
ylabel('H - Imaginary Part');
title('Pole-Zero Plot in the S-domain')



Hdis=c2d(H,(1/ts),'tustin');
[zero, pole, k] = zpkdata(Hdis, 'v');
figure;
zplane(zero, pole); 
xlabel('Hdis(BT) - Real Part');
ylabel('Hdis(BT) - Imaginary Part');
title('Pole-Zero Plot in the Z-domain')