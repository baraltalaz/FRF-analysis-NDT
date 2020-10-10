
%load function by calling datafile.mat and i value from 1 to 252
function frf= PLOTFRF(file_name,i)

clc;
%loading the required .mat file
load(file_name); 

%sampling rate
fs = coupon.path_data(i).sampling_rate;

%frequency of signal
freq = coupon.path_data(i).frequency;

%input signal
input = coupon.path_data(i).signal_actuator;
n1=length(input);
t=n1/fs;

%timestamp of data collection
x= transpose(0:1/(1999*600):t);

%output signal 
output = coupon.path_data(i).signal_sensor;
n2=length(output);
t2 = n2/fs;
cycle=coupon.cycles;
%timestamp of output data collection 

x2= transpose(0:1/(1999*600):t2);
datanumbers=(0:1:2000-1);
freqstamp= datanumbers*fs/n1;

%plot input and output signal 
figure
plot(x,input);
grid on; 
hold on 
plot(x2,output)
title(['Input and output for signal ']);
legend ({'Input','Output'});

%fast fourior transformation of input and output signal
finput=fft(input);
foutput=fft(output);

%frequency response calculation
frf=foutput./finput;

%ploting the frf
figure 
newfrf=medfilt1(abs(frf));

plot(freqstamp,newfrf);

title(['After load cycle:',num2str(cycle)]);
xlabel('Frequency')
ylabel('Magnitude') 

PLOTPEAKS(finput,foutput);
end 

