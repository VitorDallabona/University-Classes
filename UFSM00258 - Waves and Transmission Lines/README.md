# Waves and Transmission Lines: CST Studio Experiments

This repository contains some simulations and experimental analyses conducted for the **Waves and Transmission Lines** (Ondas e Linhas de Transmissão) course. The experiments were modeled and simulated using **CST Studio Suite**, focusing on wave polarization and the propagation of electromagnetic modes inside rectangular and circular waveguides.

## Wave Polarization Analysis (Exp2)

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/E_field2-1.png" alt="Electric Field at 2 GHz" width="600">
  <br>
  <em>Vector representation of the Electric Field (E-field) demonstrating wave polarization patterns.</em>
</p>
<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/H_field1-5.png" alt="Magnetic Field at 2 GHz" width="600">
  <br>
  <em>Vector representation of the Magnetic Field (H-field) orthogonal to the E-field.</em>
</p>

## Rectangular Waveguide Mode Analysis (Exp5)
The propagation of electromagnetic waves inside a rectangular waveguide depends heavily on the operating frequency and the physical dimensions of the guide. Below are the field distributions showcasing different transverse modes.

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/E_field_3.3_mode2.png" alt="Mode 2 at 3.3 GHz" width="600">
  <br>
  <em>Electric field distribution corresponding to Mode 2 propagation at 3.3 GHz.</em>
</p>

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/E_field_3.3_mode3.png" alt="Mode 3 at 3.3 GHz" width="600">
  <br>
  <em>Electric field distribution corresponding to Mode 3 propagation at 3.3 GHz.</em>
</p>

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/E_field_7.3_mode1.png" alt="Mode 1 at 7.3 GHz" width="600">
  <br>
  <em>High-frequency E-field propagation for Mode 1 at 7.3 GHz, showing shorter wavelengths inside the cavity.</em>
</p>

## Circular Waveguide Modeling (Exp5_circ)
In addition to rectangular geometries, circular waveguides were modeled to analyze their specific boundary conditions and mode propagation characteristics (such as $TE_{nm}$ and $TM_{nm}$ modes).

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/bloco_circ_modelado.png" alt="Circular Waveguide Model" width="600">
  <br>
  <em>Perfect Electric Conductor (PEC) circular waveguide modeled in CST Studio Suite.</em>
</p>

<p align="center">
  <img src="/UFSM00258 - Waves and Transmission Lines/images/E_field_cross_sec.png" alt="E-field cross section at 2.6 GHz" width="600">
  <br>
  <em>Absolute magnitude of the E-field across the waveguide's longitudinal cross-section at 2.6 GHz.</em>
</p>

## Technologies and Concepts
* **CST Studio Suite**: Used for 3D full-wave electromagnetic simulation and field visualization.
* **Electromagnetics**: Application of Maxwell's equations, boundary conditions, mode excitation, and impedance matching.
