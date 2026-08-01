function rx = channel(tx,h,SNR)

%% Multipath Channel

channel_output = conv(tx,h);

%% AWGN

rx = awgn(channel_output,SNR,'measured');

end
