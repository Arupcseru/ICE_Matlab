clear;
bits = [ 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 1 0 ];
count=0;
prev_Vol=1;
amp=1;
c_amp=amp*prev_Vol;
bit =length(bits);
bit_rate = 2;
Time=bit/bit_rate;
sampling_frequency = 100;
i=1;
amplitude=zeros(1,length(bits));
c_one=0;
c_zero=0;
while i<=length(bits)
  if bits(i)==0
    c_zero=c_zeros(bits,i);
    if c_zero>=4
      if mod(c_one,2)==1
        amplitude(i+3)=c_amp;
        i=i+3;
      else 
        amplitude(i)=-c_amp;
        amplitude(i+3)=-c_amp;
        c_amp=amplitude(i);
      end
      c_one=0;
      i=i+3;
    else
      i=i+c_zero-1;
    end
  else
    c_one=c_one+1;
    amplitude(i)=-c_amp;
    c_amp=amplitude(i);
  end
  i=i+1;
end
%disp(bits);
%disp(amplitude);

time=0:1/sampling_frequency:Time;
x=1;
for i=1:length(time)
  y_value(i)=amplitude(x);
  if time(i)*bit_rate>=x
    x=x+1;
  endif
endfor

plot(time,y_value );
axis([0 Time -3 3]);
grid on;



%demodulation

x=1;
for i = 1:length(time)
    if time(i)*bit_rate>=x
        enc_bits(x)=y_value(i)/amp;
        x = x + 1;
    end
end
disp(bits);
disp(enc_bits);
flag=0;

x = 1;
tmp=prev_Vol;
i=1;
while i<=length(enc_bits)
        if enc_bits(i)== 0
          ans_bits(i) = 0;
        else
          if tmp==enc_bits(i) && i>3
            ans_bits(i-3)=0;
            ans_bits(i)=0;
           else
            tmp=enc_bits(i);
            ans_bits(i)=1;
           end
      end
      i=i+1;
end
disp('Demodulation');
disp(ans_bits);
  
