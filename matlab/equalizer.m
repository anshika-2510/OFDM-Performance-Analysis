function equalized = equalizer(rx_fft,h,N)

H = fft(h,N);

equalized = rx_fft./H;

end
