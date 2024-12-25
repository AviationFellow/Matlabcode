
N=11;
al=(N-1)/2;
n=0:N-1;
option='y';
while(option=='y' || option=='Y')
choose=input("Choose the type of filter\n 1.Low pass\n 2.High pass\n 3.Bandpass\n 4.Bandstop \nYour choice:");
switch(choose)
    case 1
        wc=pi*input("cutoff frequency: ");
        hd=sin((n-al)*wc)./(pi*(n-al));
        hd(al+1)=wc/(pi);

    case 2
        wc=pi*input("cutoff frequency: ");
        hd=(sin((n-al)*pi)-sin((n-al)*wc))./(pi*(n-al));
        hd(al+1)=1-(wc/pi);

    case 3
        wl=pi*input("lower cutoff frequency: ");
        wh=pi*input("lower cutoff frequency: ");
        hd=(sin((n-al)*wh)-sin((n-al)*wl))./(pi*(n-al));
        hd(al+1)=(wh-wl)/pi;

    case 4
        wl=pi*input("lower cutoff frequency: ");
        wh=pi*input("lower cutoff frequency: ");
        hd=(sin((n-al)*wl)-sin((n-al)*wh))./(pi*(n-al));
        hd(al+1)=1-((wh-wl)/pi);
end

w=0:0.01:pi;
filter=input("\nChoose the type of Window\n 1.Rectangular\n 2.Hamming\n 3.Hanning \nYour choice:");
switch(filter)
    case 1
        %RECTANGULAR WINDOW
        w1=boxcar(N);
        h=hd.*w1';
        h0=freqz(h,1,w);
        plot(w,10*log10(abs(h0)));
        title("Rectangular Window")
        
    case 2   
        %HAMMING WINDOW
        w2=hamming(N);
        h=hd.*w2';
        h1=freqz(h,1,w);
        plot(w,10*log10(abs(h1)));
        title("Hamming Window")
       
    case 3    
        %HANNING WINDOW
        w3=hanning(N);
        h=hd.*w3';
        h2=freqz(h,1,w);
        plot(w,10*log10(abs(h2)));
        title("Hanning Window")
end
option=input("Want to continue (y/n): ");
end