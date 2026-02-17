# Queue Simulation System - Data Structures

This repository contains the final assignment for the **Data Structures and Programming** course (UFSM00272) at the **Federal University of Santa Maria (UFSM)**. The project implements a multi-process system using Queues and Priority Queues that communicate through shared files.

## Project Overview

The system consists of two independent programs running simultaneously in separate terminal windows. They share access to data files to synchronize the state of the queues and simulation controls.

### 1. Menu Program (`menu.c`)
The controller and user interface:
* **Queue Management**: Insert or remove items from the system.
* **Priority Logic**: Items with **Priority 0** are sent to the **Normal Queue**, while any other priority value sends the item to the **Priority Queue**.
* **Simulation Control**: Set the system status to **Wait** (idle), **Simulate** (processing), or **Terminate** (close simulation).
* **File Sync**: Every change to the queues is written to disk so the simulation program can detect updates.

### 2. Simulation Program (`simulacao.c`)
The processing engine:
* **Processing Order**: Always checks the **Priority Queue** first. If empty, it processes items from the **Normal Queue**.
* **Execution**: Processing is simulated using a `sleep()` function. 
* **Dynamic Reading**: Continuously polls the shared files to receive new items or control commands from the Menu.


## How to Run

To execute the system properly, you must run the **Menu** (```processamento```) and the **Simulation** (```simulação```) in two separate terminal windows simultaneously.

---
## ⚠️ Known Issues / Bugs
![Bug](https://img.shields.io/badge/known_bug-priority_queue_sorting-orange)

- **Priority Queue Reordering**: The system is currently **95% functional**.
  - **Issue**: After removing the item with the highest priority, the queue logic does not automatically re-sort or re-heapify the remaining elements.
  - **Consequence**: The next removal might not strictly follow the priority order until the queue is manually reset or re-evaluated.
 
---
**Professor**: Jonas Bulegon Gassen 

**Institution**: Federal University of Santa Maria (UFSM)
