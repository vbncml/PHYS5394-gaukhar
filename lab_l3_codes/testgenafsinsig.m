%% Plot the AM-FM sinusoid signal
% Signal parameters
f0 = 70;
f1 = 60;
f2 = 30;
A = 10;
b = 2;
% Instantaneous frequency after 1 sec is 
maxFreq = f0-b*f1*sin(2*pi*f1);
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = genafsinsig(timeVec,A,b,[f0,f1,f2]);

%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',14);

%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));
