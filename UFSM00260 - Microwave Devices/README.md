# Microwave Devices — Electromagnetic Modeling & Simulation (`UFSM00260`)

![Ansys HFSS](https://img.shields.io/badge/Ansys-HFSS-FFB71B?style=flat-square)
![CST Studio Suite](https://img.shields.io/badge/CST-Studio_Suite-005386?style=flat-square)
![Cadence AWR](https://img.shields.io/badge/Cadence-AWR-E31837?style=flat-square)
![Smith V4.1](https://img.shields.io/badge/Smith_Chart-V4.1-4A90E2?style=flat-square)

This repository contains the analytical synthesis, 3D electromagnetic modeling, parametric optimization, and S-parameter analysis of passive microwave circuits developed for the **Microwave Devices (`UFSM00260`)** course at the **Federal University of Santa Maria (UFSM)** — Telecommunications Engineering / Technology Center, taught by **Prof. Candice Müller** (2026).

---

## Repository Overview

| Experiment | Topic | Center / Cutoff Freq. | Substrate | Primary Tools |
| :--- | :--- | :---: | :--- | :--- |
| **[Exp 1](#experiment-1-microstrip-transmission-lines--stub-matching)** | Microstrip Transmission Lines & Shunt Stub Matching | 2.00 GHz | FR-4 (ε<sub>r</sub> = 4.3, h = 1.6 mm) | Ansys HFSS, Smith V4.1 |
| **[Exp 2](#experiment-2-quadrature-hybrid-couplers)** | Single-Section & Broadband Two-Section Branch-Line Couplers | 3.28 GHz | Rogers 3035 (ε<sub>r</sub> = 3.6, h = 1.52 mm) | Ansys HFSS |
| **[Exp 3](#experiment-3-power-dividers)** | T-Junction, λ/4 Matching Networks & Wilkinson Power Divider | 2.28 GHz | Rogers RO4003 (ε<sub>r</sub> = 3.38, h = 0.813 mm) | Ansys HFSS, Smith Chart |
| **[Exp 4](#experiment-4-chebyshev-low-pass-microwave-filters)** | 3rd- & 7th-Order Chebyshev Low-Pass Filters (1 dB Ripple) | 3.55 GHz | Rogers RO4003 (ε<sub>r</sub> = 3.55, h = 1.56 mm) | Cadence AWR, CST Studio Suite, LineCalc |

---

## Experiment 1: Microstrip Transmission Lines & Stub Matching

Design and 3D electromagnetic analysis of a 50 Ω microstrip transmission line and shunt stub impedance matching networks operating at **2 GHz** on an **FR-4** substrate (ε<sub>r</sub> = 4.3, h = 1.6 mm, t<sub>h</sub> = 35 μm).

<p align="center">
  <img src="/UFSM00260 - Microwave Devices/images/pcb_with_stub_geo6.png" alt="Open-Circuited Shunt Stub 3D Model" width="48%" />
</p>

---

## Experiment 2: Quadrature Hybrid Couplers

Synthesis, 3D modeling, and parametric optimization (Optimetrics) of 3 dB 90° branch-line couplers ( **Single-Section Branch-Line Coupler** and **Two-Section Broadband Coupler**) at **3.28 GHz** on a **Rogers 3035** substrate (ε<sub>r</sub> = 3.6, tan δ = 0.0015, h = 1.52 mm) in **Ansys HFSS**.

<p align="center">
  <img src="/UFSM00260 - Microwave Devices/images/initial_design.png" alt="Two-Section Broadband Hybrid Coupler 3D Model" width="52%" />
  <img src="/UFSM00260 - Microwave Devices/images/geo_perspec_without_opt.png" alt="Single-Section Hybrid Coupler 3D Model" width="45%" />
</p>

### Modeled Components & Highlights
* **Single-Section Branch-Line Coupler:** Designed with 50 Ω vertical arms (W<sub>50</sub> = 3.45 mm) and 35.35 Ω horizontal arms (W<sub>35</sub> = 5.64 mm), optimized to L<sub>50</sub> = 15.0 mm and L<sub>35</sub> = 15.5 mm to counter T-junction parasitic reactances. Delivered S<sub>11</sub> = −37.5 dB, equal power division (≈ −3 dB, ΔS < 0.3 dB), 88.86° phase difference, isolation down to ≈ −50 dB, and a 19.81% fractional bandwidth (3.03–3.68 GHz).
* **Two-Section Broadband Coupler:** Cascaded topology with Z<sub>1</sub> = Z<sub>4</sub> ≈ 120.7 Ω (W<sub>120</sub> = 0.52 mm) and Z<sub>2</sub> = Z<sub>3</sub> ≈ 35.35 Ω (W<sub>35</sub> = 5.64 mm), optimized to L = 14.1 mm. Achieved a flat broadband return loss (S<sub>11</sub> < −10 dB from 2.9 GHz to > 4.5 GHz, reaching −33 dB at 3.28 GHz), at the expense of degraded power-division balance (ΔS ≈ 8 dB) due to central junction discontinuities.

---

## Experiment 3: Power Dividers

Progressive design and comparative analysis of 3-port power dividers at **2.28 GHz** on a **Rogers RO4003** substrate (ε<sub>r</sub> = 3.38, h = 0.813 mm) using **Ansys HFSS** and **Smith Chart**.

<p align="center">
  <img src="/UFSM00260 - Microwave Devices/images/design_part3.png" alt="Wilkinson Power Divider 3D Model" width="40%" />
  <img src="/UFSM00260 - Microwave Devices/images/design_part2.png" alt="T junction 3D Model with impedance match" width="48%" />
</p>

### Modeled Components & Highlights
* **Basic T-Junction Power Divider:** 50 Ω input (W<sub>50</sub> = 1.85 mm) splitting into 70.7 Ω arms (W<sub>70</sub> = 1.05 mm) with a 0.2 mm optimized chamfer. Achieved S<sub>11</sub> = −32.02 dB (VSWR = 1.05) and S<sub>21</sub>/S<sub>31</sub> ≈ −3.04 dB, but inherently lacked output port isolation (S<sub>23</sub> = −5.98 dB).
* **1-Section λ/4 Matching Network:** Implemented a 70.7 Ω quarter-wave transformer to match 50 Ω loads to 100 Ω at the junction, yielding S<sub>22</sub> = −25.76 dB (VSWR = 1.11) and S<sub>21</sub> = −3.05 dB on the matched port, while confirming that a lossless reciprocal 3-port network cannot be simultaneously matched at all ports.
* **2-Section Binomial Matching Network:** Cascaded λ/4 sections (84.1 Ω and 59.5 Ω) tuned with HFSS's Adaptive Single-Objective (Gradient) optimizer. Expanded the matching bandwidth with S<sub>22</sub> = −28.35 dB (VSWR = 1.08) and S<sub>21</sub> ≈ −3.06 dB, though cross-coupling remained high (S<sub>23</sub> ≈ −3.08 dB).
* **Wilkinson Power Divider:** Folded 70.7 Ω arms bridged by a 100 Ω (2Z<sub>0</sub>) isolation resistor. Even prior to geometric optimization (with input resonance shifted to ≈ 2.6 GHz due to trace bends), it improved output isolation to S<sub>23</sub> = −9.22 dB and achieved symmetric output matching (S<sub>22</sub>/S<sub>33</sub> ≈ −20.8 dB) at 2.28 GHz.

---

## Experiment 4: Chebyshev Low-Pass Microwave Filters

Synthesis, 3D EM simulation, and comparison of **1 dB ripple Chebyshev low-pass filters** with a cutoff frequency of **f<sub>c</sub> = 3.55 GHz** (Z<sub>0</sub> = 50 Ω) on a **Rogers RO4003** substrate (ε<sub>r</sub> = 3.55, h = 1.56 mm, t = 0.035 mm).

<p align="center">
   <img src="/UFSM00260 - Microwave Devices/images/design_part7.png" alt="7th-Order Stepped-Impedance Filter in CST" width="70%" />
</p>

### Modeled Components & Highlights
* **3rd-Order Lumped-Element Prototype (Cadence AWR):** Ideal T-network baseline (L<sub>1</sub> = L<sub>2</sub> = 4.536 nH, C<sub>1</sub> = 0.894 pF) validating the analytical 1 dB passband ripple and 3.55 GHz cutoff response.
* **3rd-Order Parallel Open-Stub Filter (CST Studio Suite):** Synthesized via Richards' Transformation and Kuroda's Identities into three open-circuited parallel stubs (67.7 Ω outer, 50.29 Ω center) connected by 74.7 Ω series lines. Parameter sweep optimized stub lengths to L<sub>s1</sub> = 7.16 mm and L<sub>s2</sub> = 7.50 mm (S<sub>21</sub> = −3.02 dB at 3.55 GHz), offering steeper transition selectivity and deeper stopband attenuation poles.
* **3rd-Order Stepped-Impedance Filter (CST Studio Suite):** Alternating high-impedance (Z<sub>h</sub> = 115 Ω, W<sub>h</sub> = 0.60 mm) and low-impedance (Z<sub>l</sub> = 20 Ω, W<sub>l</sub> = 12.25 mm) sections. Optimized to l<sub>h</sub> = 7.00 mm and l<sub>l</sub> = 2.30 mm (S<sub>21</sub> = −3.04 dB, S<sub>11</sub> = −2.97 dB at 3.55 GHz), providing a compact linear layout.
* **7th-Order Stepped-Impedance Filter (CST Studio Suite):** Expanded to N = 7 to significantly steepen the stopband roll-off. Compensated for severe parasitic fringing across 6 abrupt width transitions using 2D scalar length reduction (0.70× inductive, 0.75× capacitive), realigning the cutoff to 3.55 GHz (S<sub>21</sub> = −3.10 dB, S<sub>11</sub> = −2.92 dB).

---

## Author

**Vitor Dallabona**  
[GitHub](https://github.com/VitorDallabona) • [LinkedIn](https://www.linkedin.com/in/vitordallabona)
