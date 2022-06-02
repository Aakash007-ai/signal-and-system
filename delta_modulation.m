%% Delta Modulation (DM) 
pkg load communications
%delta modulation = 1-bit differential pulse code modulation (DPCM) 
predictor = [0 1]; % y(k)=x(k-1) 
%partition = [-1:.1:.9];codebook = [-1:.1:1]; 
step=0.2; %SFs>=2pifA 
partition = [0];codebook = [-1*step step]; %DM quantizer 
 
t = [0:pi/20:2*pi]; 
x = 1.1*sin(2*pi*0.1*t); % Original signal, a sine wave 
%t = [0:0.1:2*pi];x = 4*sin(t); 
%x=exp(-1/3*t); 
%x = sawtooth(3*t); % Original signal 
 
% Quantize x(t) using DPCM. 
encodedx = dpcmenco(x,codebook,partition,predictor); 
 
% Try to recover x from the modulated signal. 
decodedx = dpcmdeco(encodedx,codebook,predictor); 
distor = sum((x-decodedx).^2)/length(x) % Mean square error 
% plots 
figure,subplot(2,2,1);plot(t,x);xlabel('time');title('original signal'); 
subplot(2,2,2);stairs(t,10*codebook(encodedx+1),'--');xlabel('time');title('DM output'); 
subplot(2,2,3);plot(t,x);hold;stairs(t,decodedx);grid;xlabel('time');title('received signal');