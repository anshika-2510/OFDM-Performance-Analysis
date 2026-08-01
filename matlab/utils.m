function utils(N)

bits = randi([0 1],1,N);

modData = 2*bits-1;

ifftData = ifft(modData);

spectrum = abs(fftshift(fft(ifftData,1024)));

f = linspace(-0.5,0.5,length(spectrum));

figure

plot(f,10*log10(spectrum),'LineWidth',2)

grid on

xlabel('Normalized Frequency')

ylabel('Power (dB)')

title('OFDM Signal Spectrum')

end
