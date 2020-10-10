
%calculation and plot of peaks 
function PLOTPEAKS(finput,foutput)

%frequency response calculation
frf=foutput./finput;

Maxima=max(foutput,[],'all');
[loc,Peako]=findpeaks(abs(foutput),'threshold', 1000);
peakoo=(Peako-1)*fs/n1;
M=medfilt1(abs(foutput));
figure 

MM=abs(foutput);
%ppp=normalize(MM,M);
plot(freqstamp, M);
hold on 
plot(peakoo,loc,'o');

end 

