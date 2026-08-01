function detected = receiver(rx,h,N,CP)

%% Remove CP

rx = rx(CP+1:CP+N);

%% FFT

rx_fft = fft(rx);

%% Equalization

rx_equalized = equalizer(rx_fft,h,N);

%% Detection

detected = real(rx_equalized)>0;

end
