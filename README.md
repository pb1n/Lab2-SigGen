<center>

## EIE2 Instruction Set Architecture & Compiler (IAC)

---
## Lab 2 - Signal Generation and Capture

**_Robin Masih_**

---

</center>

## Objectives
By the end of this experiment, you should be able to:
* write a basic System Verilog specification for a memory component
* pre-load the memory with known contents stored in an initialization file
* design a signal generator by combining a counter with a ROM component
* change the frequency of the signal with rotary encoder on Vbuddy
* generate two sinusoidal signals simultaneously with different phases using dual-port ROM
* capture and store a audio signal using the microphone on Vbuddy and a RAM component
* read and write to a RAM component simultaneously
* use parameterisation to generalise designs for different address or data widths

## Task 1 - Simple sinewave generator

A sinewave was observed, although it took some time because I have a smooth brain and didn't copy something correctly.

### _Test-yourself Challenge_ 

Modified the design so that **_vbdValue()_** function is used to chage the frequency of the sinewave generated. The higher **_vbdValue()_** is, the higher the frequency of the sinewave becomes.

## Task 2 - Sine and Cosine Dual wave generation

Two sinusodial waves are observed when simulating on the vbuddy. To get this working I:
- Changed the rom.sv file to accommodate dual port rom. It now takes in two addresses and outputs two corresponding values.
- Added logic to the sinegen.sv file to add an offset to the address, which changes the phase of the second wave that is plotted. 
- Changed and added logic to the test bench to plot the two signals simultaneously.

## Task 3 - Capture and display audio signal in RAM

The goal of Task 3 is to capture real audio signal using the microphone/amplifier module on Vbuddy. These samples are written to a dual-port RAM stored in successive locations. At the same time, read back from the RAM the store signal at a different address offset from the write address. In this way, the retrieved signal is a delayed version of the original signal.

The difference between the read and write addresses is the offset. The **_vbdValue()_** function is used to vary this offset using the rotary encoder.

To complete this task I:
- Made a dual port RAM module
- Made a module, sigdelay, which utilises a counter and dual port RAM module.
  - The counter simply increments the write address.
  - The offset from **_vbdValue()_** is added to the write address to make the read address.
  - The RAM module stores an audio sample at the write address, and outputs an audio sample stored at the read address.

Observation:
- When a sinewave is picked up by the microphone, it is shown after an offset of clock cycles on the Vbuddy display.



