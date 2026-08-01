# OFDM Performance Analysis

Orthogonal Frequency Division Multiplexing (OFDM) is a multi carrier modulation technique widely used in modern wireless communication systems such as LTE, LTE Advanced, 5G NR, and Wi-Fi. It divides a high-rate data stream into several low rate parallel streams and transmits them over multiple orthogonal subcarriers. This improves spectral efficiency and provides strong resistance to multipath fading.
In this project, the performance of an OFDM communication system is analyzed using MATLAB simulation. Key performance parameters studied include Bit Error Rate (BER) versus Signal-to-Noise Ratio (SNR), spectral efficiency, Peak-to-Average Power Ratio (PAPR), and system performance in multipath fading channels.
The simulation models the complete OFDM transceiver chain. At the transmitter, binary data is generated, converted from serial to parallel form, modulated, and processed using IFFT before adding a cyclic prefix. At the receiver, the cyclic prefix is removed, FFT is performed, channel equalization is applied, and the recovered data is converted back to serial form. Channel conditions such as Additive White Gaussian Noise (AWGN) is considered. The results demonstrate OFDM’s ability to reduce inter-symbol interference (ISI) and efficiently utilize available bandwidth.

This project focuses on implementing a basic OFDM transceiver in MATLAB and analyzing its performance under different channel conditions. The simulation models the full communication process, starting from bit generation at the transmitter to bit recovery at the receiver.
Performance metrics such as BER vs SNR, PAPR characteristics, and system behavior in AWGN and multipath channel conditions are studied. The results are analyzed to understand the advantages of OFDM in terms of spectral efficiency, robustness to multipath interference, and system design trade-offs.


---

## Features

- Complete OFDM Transceiver
- BPSK Modulation
- IFFT/FFT Based OFDM
- Cyclic Prefix Insertion and Removal
- Multipath Channel Model
- AWGN Channel
- Zero-Forcing Equalization
- BER vs SNR Analysis
- PAPR Analysis
- OFDM Spectrum Analysis

---

## System Architecture
</p align ='centre'>
<img width="376" height="356" alt="image" src="https://github.com/user-attachments/assets/a37276cc-7048-4d4a-8784-c2fa02e0149b" />
</p>

## Simulation Parameters

| Parameter | Value |
|-----------|------:|
| Number of Subcarriers | 64 |
| Cyclic Prefix Length | 16 |
| Modulation | BPSK |
| Channel | Multipath `[0.9 0.4 0.2]` |
| SNR Range | 0–20 dB |
| OFDM Symbols | 1000 |

---

## Performance Metrics

### Bit Error Rate (BER)

BER performance is evaluated over a range of SNR values to measure the reliability of data transmission under noisy channel conditions.

---

### Peak-to-Average Power Ratio (PAPR)

PAPR distribution is analyzed to study the power characteristics of OFDM signals and their impact on transmitter power amplifiers.

---

### Spectrum Analysis

Frequency spectrum is generated to demonstrate orthogonal subcarrier allocation and efficient bandwidth utilization.

---

## Project Directory

```
matlab/
│
├── ofdm_main.m
├── transmitter.m
├── receiver.m
├── channel.m
├── equalizer.m
└── utils.m
```

---

## Results

### BER vs SNR

- BER decreases significantly with increasing SNR.
- Near error-free transmission is achieved at high SNR values.

---

### PAPR

- Most OFDM symbols exhibit PAPR values around 5–7 dB.
- High PAPR remains one of the major limitations of OFDM.

---

### Spectrum

- Orthogonal subcarriers overlap without introducing inter-carrier interference.
- Efficient bandwidth utilization is demonstrated.

---

## Technologies Used

- MATLAB
- Signal Processing Toolbox
- Communication Toolbox

---

## Applications

- LTE / LTE-Advanced
- 5G NR
- Wi-Fi (IEEE 802.11)
- WiMAX
- Digital Broadcasting
- LiFi
- Cognitive Radio

---

## Future Improvements

- QPSK
- 16-QAM
- 64-QAM
- MMSE Equalizer
- MIMO-OFDM
- OFDMA
- PAPR Reduction Techniques
- Rayleigh/Rician Fading Models

