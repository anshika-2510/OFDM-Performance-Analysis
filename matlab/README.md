# OFDM Main Simulation

## Overview

`ofdm_main.m` is the top-level script of the OFDM simulation. It initializes the simulation parameters, controls the transmitter, channel, and receiver modules, computes the Bit Error Rate (BER), evaluates the Peak-to-Average Power Ratio (PAPR), and generates the final performance plots.

This script serves as the entry point for the entire OFDM communication system.


## Workflow

```
Initialize Parameters
        │
        ▼
Generate OFDM Symbol
        │
        ▼
Transmit Signal
        │
        ▼
Channel Model
        │
        ▼
Receiver Processing
        │
        ▼
BER Calculation
        │
        ▼
Repeat for every OFDM Symbol
        │
        ▼
Repeat for every SNR
        │
        ▼
Generate Performance Plots
```

---

## Parameters

| Parameter | Description |
|------------|-------------|
| N | Number of OFDM subcarriers |
| CP | Cyclic Prefix Length |
| numSymbols | Number of OFDM frames |
| SNR_dB | Signal-to-Noise Ratio range |
| h | Multipath channel impulse response |


## Main Operations

- Initializes simulation parameters
- Calls the transmitter module
- Passes transmitted signal through the channel
- Calls the receiver module
- Calculates BER
- Stores PAPR values
- Generates BER curve
- Generates PAPR histogram
- Calls spectrum visualization

## Outputs

- BER vs SNR Plot
- PAPR Distribution
- OFDM Signal Spectrum

# OFDM Transmitter

## Overview

`transmitter.m` implements the complete OFDM transmitter chain.

The transmitter converts randomly generated binary data into an OFDM waveform suitable for transmission over a wireless communication channel.


## Processing Flow

```
Random Bits
      │
      ▼
BPSK Modulation
      │
      ▼
IFFT
      │
      ▼
Calculate PAPR
      │
      ▼
Insert Cyclic Prefix
      │
      ▼
Transmit Signal
```

---

## Processing Stages

### Random Bit Generation

Generates an N-bit random binary sequence.


### BPSK Mapping

Maps

```
0 → -1

1 → +1
```

---

### IFFT

Transforms frequency-domain symbols into the time-domain OFDM waveform.

This creates orthogonal subcarriers suitable for transmission.

---

### PAPR Calculation

Calculates

```
Peak Power
──────────────
Average Power
```

This metric is important for evaluating transmitter efficiency.


### Cyclic Prefix

Copies the last CP samples and appends them to the front of the OFDM symbol.

Benefits

- Reduces ISI
- Converts linear convolution into circular convolution
- Enables frequency-domain equalization

---

## Inputs

| Variable | Description |
|-----------|-------------|
| N | Number of Subcarriers |
| CP | Cyclic Prefix Length |

---

## Outputs

| Variable | Description |
|-----------|-------------|
| tx_cp | OFDM signal with cyclic prefix |
| bits | Original transmitted bits |
| papr | Peak-to-Average Power Ratio |

---

## Concepts Covered

- OFDM Modulation
- IFFT
- Cyclic Prefix
- PAPR
- Digital Modulation

  # Wireless Channel

## Overview

`channel.m` models the wireless communication channel between the transmitter and receiver.

The transmitted OFDM signal experiences both multipath propagation and Additive White Gaussian Noise (AWGN), closely representing practical wireless environments.

---

## Channel Model

```
Transmitted Signal
        │
        ▼
Multipath Channel
        │
        ▼
AWGN
        │
        ▼
Received Signal
```

---

## Multipath Channel

Impulse Response

```
h = [0.9 0.4 0.2]
```

The transmitted signal reaches the receiver through multiple delayed paths.

---

## AWGN

Gaussian noise is added according to the specified SNR value.

This simulates thermal noise present in practical receivers.

---

## Inputs

| Variable | Description |
|-----------|-------------|
| tx | Transmitted OFDM Signal |
| h | Channel Impulse Response |
| SNR | Signal-to-Noise Ratio |

---

## Output

| Variable | Description |
|-----------|-------------|
| rx | Received Signal |

---

# Zero-Forcing Equalizer

## Overview

`equalizer.m` compensates for the distortion introduced by the multipath wireless channel.

The equalizer estimates the transmitted symbols by removing the channel effects in the frequency domain.

---

## Working Principle

```
Received FFT
      │
      ▼
Channel Frequency Response
      │
      ▼
Division
      │
      ▼
Recovered Symbols
```

---

## Mathematical Operation

```
Equalized Symbol

Y(k)
──────
H(k)
```

where

- Y(k) is the received symbol
- H(k) is the channel response

---

## Inputs

| Variable | Description |
|-----------|-------------|
| rx_fft | FFT of received OFDM signal |
| h | Channel impulse response |
| N | Number of Subcarriers |

---

## Output

| Variable | Description |
|-----------|-------------|
| equalized | Equalized symbols |

---

## Advantages

- Simple implementation
- Low computational complexity

---

## Limitations

- Amplifies noise at low SNR
- Sensitive to deep channel fades

---

## Concepts Covered

- Zero Forcing Equalization
- FFT
- Frequency Domain Processing

# OFDM Receiver

## Overview

`receiver.m` implements the receiver side of the OFDM communication system.

It reconstructs the transmitted information by reversing the transmitter operations and compensating for channel distortion.

---

## Receiver Flow

```
Received Signal
      │
      ▼
Remove Cyclic Prefix
      │
      ▼
FFT
      │
      ▼
Equalization
      │
      ▼
BPSK Detection
      │
      ▼
Recovered Bits
```

---

## Processing Stages

### Cyclic Prefix Removal

Removes the CP before FFT processing.

---

### FFT

Transforms the received OFDM waveform into the frequency domain.

---

### Equalization

Uses Zero-Forcing Equalization to compensate for channel distortion.

---

### Detection

Decision Rule

```
Real(x) > 0

↓

Bit = 1

Else

Bit = 0
```

---

## Inputs

| Variable | Description |
|-----------|-------------|
| rx | Received Signal |
| h | Channel Response |
| N | Number of Subcarriers |
| CP | Cyclic Prefix Length |

---

## Output

Recovered binary sequence.

---

## Concepts Covered

- FFT Demodulation
- Channel Equalization
- BPSK Detection
- Digital Receiver Design

  # Utility Functions

## Overview

`utils.m` contains helper functions used for visualization and post-processing of the OFDM simulation.

The current implementation generates the frequency spectrum of the transmitted OFDM signal.

---

## Processing Flow

```
Generate Random Bits
        │
        ▼
BPSK Mapping
        │
        ▼
IFFT
        │
        ▼
FFT
        │
        ▼
Frequency Spectrum
```

---

## Spectrum Analysis

The generated spectrum demonstrates

- Orthogonal subcarriers
- Bandwidth utilization
- OFDM frequency characteristics

---

## Output

- OFDM Signal Spectrum

---

## Why Spectrum Analysis?

Spectrum visualization helps verify

- Correct OFDM modulation
- Orthogonal subcarrier placement
- Efficient bandwidth usage

---

## Concepts Covered

- FFT
- Frequency Spectrum
- Signal Visualization
- Spectral Analysis
