# Results

This directory contains the simulation outputs generated from the MATLAB implementation of the OFDM communication system.

The results demonstrate the performance of the implemented OFDM transceiver under Additive White Gaussian Noise (AWGN) and multipath channel conditions. The evaluation focuses on key communication metrics including Bit Error Rate (BER), Peak-to-Average Power Ratio (PAPR), and frequency spectrum characteristics.

---
## BER Analysis
The BER performance of the OFDM system over the multipath channel is shown in Figure 1. The results indicate a clear inverse relationship between BER and SNR.
At low SNR values (0–4 dB), the BER is relatively high (on the order of 10⁻¹ to 10⁻²), as noise dominates the received signal and causes frequent bit errors. As the SNR increases, the noise power reduces relative to the signal, allowing more accurate symbol detection.
A sharp decline in BER is observed beyond 8 dB, where the effect of noise becomes less significant and the equalization process effectively compensates for channel distortion. At higher SNR values (12–14 dB), the BER reaches values close to 10⁻⁵, indicating near error-free transmission.
This behavior confirms that the combination of cyclic prefix and frequency-domain equalization successfully mitigates multipath effects in the system.
 


<img width="375" height="239" alt="image" src="https://github.com/user-attachments/assets/f7a55cee-77e6-4a25-98a3-0fae2c79174c" />

---
## PAPR Analysis
 The histogram indicates that the majority of OFDM symbols have PAPR values concentrated between 5 dB and 7 dB, with a long tail extending up to approximately 10–11 dB.
This distribution arises due to the summation of multiple independently modulated subcarriers in the time domain. When subcarriers add constructively, large peaks are formed, resulting in high instantaneous power.
For an OFDM system with N=64N subcarriers, the Peak-to-Average Power Ratio (PAPR) is defined as
<img width="196" height="46" alt="image" src="https://github.com/user-attachments/assets/eb0d71c5-cb3f-4f15-89e5-5bd494d98eaf" />


The time-domain OFDM signal obtained after applying  Inverse Fast Fourier Transform (IFFT) is 
<img width="290" height="44" alt="image" src="https://github.com/user-attachments/assets/08bb9bc6-e172-4b2b-a2c1-44ac012c699f" />

where X(k) represents the frequency-domain symbols. Since BPSK modulation is used, the magnitude of each symbol is 1 for all subcarriers.

Subcarrier wise power contribution:

<img width="306" height="168" alt="image" src="https://github.com/user-attachments/assets/0c8c411b-fc50-48b7-ace7-721fccbd9c6d" />


### Worst-Case Condition (Constructive Addition)
If all subcarriers align in phase, the maximum peak power occurs.

<img width="359" height="210" alt="image" src="https://github.com/user-attachments/assets/36499b15-4b20-4cf1-93c4-679205f54907" />

The observed PAPR values are consistent with theoretical expectations for OFDM systems with 64 subcarriers. The presence of high PAPR highlights a key limitation of OFDM, as it requires power amplifiers with a wide linear operating range, reducing overall power efficiency.

<img width="508" height="322" alt="image" src="https://github.com/user-attachments/assets/3c6917fd-3360-44fd-8b65-aef7306c6477" />

## Spectrum Analysis
The frequency spectrum of the OFDM signal is shown in Figure 3. The spectrum exhibits multiple narrowband components corresponding to individual subcarriers.
These subcarriers are closely spaced and overlap in frequency, but remain orthogonal due to the IFFT-based implementation. The spectral shape demonstrates that each subcarrier occupies a sinelike frequency response, with peaks aligned at the center frequencies.
The overlapping nature of the subcarriers allows efficient utilization of bandwidth without introducing inter-carrier interference. This confirms one of the key advantages of OFDM in achieving high spectral efficiency.

<img width="514" height="325" alt="image" src="https://github.com/user-attachments/assets/3a29c574-b567-4f5f-92a3-c95f1c6da346" />

##  Cyclic Prefix and ISI Mitigation
The cyclic prefix (CP) plays an important role in reducing inter-symbol interference (ISI).
Without CP, multipath propagation introduces ISI, causing a noticeable BER floor.
When the CP length is greater than the channel delay spread, ISI is effectively removed.
However, CP introduces overhead, reducing the effective data rate.
Therefore, CP length must be carefully chosen to balance ISI protection and spectral efficiency.



## Summary
The simulation results provide a deeper understanding of how the OFDM system behaves under multipath channel conditions. The observed BER performance confirms that the system is highly sensitive to noise at low SNR values, where the Zero-Forcing equalizer amplifies noise due to division by small channel coefficients. This explains the relatively high BER in the low SNR region.
As the SNR increases, the impact of noise reduces and the equalization process becomes more effective, allowing accurate recovery of transmitted symbols. The use of cyclic prefix ensures that the multipath channel behaves as a circular convolution, which enables efficient frequency-domain equalization and prevents inter-symbol interference.
The PAPR results highlight an inherent limitation of OFDM systems. Since the transmitted signal is formed by summing multiple subcarriers in the time domain, occasional constructive addition leads to high peak values. This behavior is clearly observed in the histogram, where most values are concentrated in a moderate range but with a noticeable high-value tail.
The spectrum analysis demonstrates that the subcarriers are closely spaced and overlap in frequency while maintaining orthogonality. This confirms that OFDM achieves high spectral efficiency without introducing inter-carrier interference under ideal synchronization conditions.
It is also important to note that this implementation uses BPSK modulation and a simplified multipath channel model. More complex modulation schemes and realistic fading models may introduce additional challenges and performance variations, which can be explored in future work.
The generated plots demonstrate:

- Successful OFDM modulation and demodulation
- Reliable BER performance under varying SNR conditions
- Expected PAPR characteristics of OFDM signals
- Efficient bandwidth utilization through orthogonal subcarriers
- Effective mitigation of multipath effects using cyclic prefix and Zero-Forcing equalization

---


