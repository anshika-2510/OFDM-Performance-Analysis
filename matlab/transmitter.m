function [tx_cp,bits,papr] = transmitter(N,CP)

%% Generate Bits

bits = randi([0 1],1,N);

%% BPSK

modData = 2*bits-1;

%% OFDM Modulation

ifftData = ifft(modData);

%% PAPR

power = abs(ifftData).^2;

papr = max(power)/mean(power);

%% Cyclic Prefix

tx_cp = [ifftData(end-CP+1:end) ifftData];

end
