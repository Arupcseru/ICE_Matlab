clc
clear;
disp('For AM fm<fc');
Ac=input('enter carrier signal amplitude = ');%2
Am=input('enter message signal amplitude = ');%3
fc=input('enter carrier frequency = ');%100
fm=input('enter message frequency = ');%50 fm<fc 
%m=input('enter modulation index');
m=Ac/Am;
%t=input('enter time period');
t = 0:0.001:0.5; 
Xm=sin(2*pi*fm*t); % message signal
Xc=sin(2*pi*fc*t); % carrier signal
y=(1+m.*Xm).*(Ac.*Xc);
subplot(311);
plot(t,Xm);
xlabel('Time');
ylabel('Amplitude');
title('Message signal')
subplot(312)
plot(t,Xc);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');
subplot(313);
plot(t,y,'r');
xlabel('Time');
ylabel('Amplitude');
title('Modulated signal');