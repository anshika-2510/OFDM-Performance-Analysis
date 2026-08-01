clc;
clear;
close all;

%% Parameters

N = 64;
CP = 16;
numSymbols = 1000;

SNR_dB = 0:2:20;

h = [0.9 0.4 0.2];

BER = zeros(size(SNR_dB));
PAPR = [];

for k = 1:length(SNR_dB)

    errors = 0;
    totalBits = 0;

    for sym = 1:numSymbols

        %% Transmitter

        [txSignal,bits,papr] = transmitter(N,CP);

        PAPR = [PAPR papr];

        %% Channel

        rxSignal = channel(txSignal,h,SNR_dB(k));

        %% Receiver

        detectedBits = receiver(rxSignal,h,N,CP);

        errors = errors + sum(bits~=detectedBits);

        totalBits = totalBits + N;

    end

    BER(k)=errors/totalBits;

end

%% BER Plot

figure;
semilogy(SNR_dB,BER,'-o','LineWidth',2)
grid on
xlabel('SNR (dB)')
ylabel('Bit Error Rate')
title('BER Performance')

%% PAPR Plot

figure
histogram(10*log10(PAPR),30)
xlabel('PAPR (dB)')
ylabel('Frequency')
grid on
title('PAPR Distribution')

%% Spectrum

utils(N);
