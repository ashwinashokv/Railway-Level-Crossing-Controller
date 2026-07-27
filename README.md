# 🚆 Railway Level Crossing Controller

An **Automatic Railway Level Crossing Controller** implemented in **Verilog HDL** using a **Finite State Machine (FSM)**. The controller automatically controls the railway gate, warning signal, and road signal based on train arrival and departure events. The project demonstrates the complete digital design flow, including RTL design, functional simulation, and logic synthesis.

---

## 📖 Project Overview

Railway level crossings require reliable control systems to ensure the safety of both railway and road traffic. This project implements an FSM-based controller that monitors train arrival and departure signals and automatically operates the crossing gate while generating appropriate warning and road signals.

---

## ✨ Features

- Finite State Machine (FSM) based controller
- Automatic railway gate operation
- Warning signal generation
- Road traffic signal control
- Synchronous digital design
- Active-high reset support
- Functional simulation using Icarus Verilog
- RTL visualization
- Logic synthesis using Yosys
- Technology mapping and gate-level netlist generation

---

## 🛠️ Tools Used

- **Verilog HDL**
- **Icarus Verilog**
- **GTKWave**
- **Yosys**

---

## 📂 Repository Structure

```
Railway-Level-Crossing-Controller/
│
├── src/
│   └── railway_controller.v
│
├── tb/
│   └── tb_railway_controller.v
│
├── netlist/
│   └── railway_controller_netlist.v
│
├── scripts/
│   ├── synth.ys
│   └── techmap.ys
│
├── rtl/
│   └── rtl.png
│
├── techmap/
│   └── techmap.png
│
├── waveform/
│   └── railway.vcd
│
├── LICENSE
└── README.md
```

---

## 📥 Inputs

| Signal | Description |
|---------|-------------|
| `clk` | System clock |
| `reset` | Active-high reset |
| `train_arrival` | Indicates an approaching train |
| `train_departure` | Indicates the train has left the crossing |

---

## 📤 Outputs

| Signal | Description |
|---------|-------------|
| `gate` | Opens or closes the railway gate |
| `warning` | Warning indicator |
| `road_signal` | Controls road traffic signal |
| `state_out` | Current FSM state |

---

## ⚙️ Design Flow

```
Problem Specification
        │
        ▼
RTL Design (Verilog HDL)
        │
        ▼
Testbench Development
        │
        ▼
Simulation (Icarus Verilog)
        │
        ▼
Waveform Verification (GTKWave)
        │
        ▼
Logic Synthesis (Yosys)
        │
        ▼
RTL Schematic
        │
        ▼
Technology Mapping
        │
        ▼
Gate-Level Netlist
```

---

## ▶️ Simulation

Compile

```bash
iverilog -o railway src/railway_controller.v tb/tb_railway_controller.v
```

Run

```bash
vvp railway
```

View waveform

```bash
gtkwave waveform/railway.vcd
```

---

## 🔧 Logic Synthesis

Run Yosys synthesis

```bash
yosys scripts/synth.ys
```

---

# RTL Schematic

<p align="center">
<img src="rtl/rtl.png" width="1000">
</p>

---

# Technology Mapping

<p align="center">
<img src="techmap/techmap.png" width="1000">
</p>

---

## 📊 Results

- Successfully implemented an FSM-based railway crossing controller.
- Verified correct functionality through simulation.
- Generated RTL schematic using Yosys.
- Synthesized the design to a gate-level netlist.
- Generated technology-mapped logic for hardware implementation.

---

## 🚀 Future Improvements

- Add pedestrian crossing support.
- Integrate multiple railway tracks.
- Add sensor fault detection.
- FPGA implementation on Xilinx or Intel FPGA boards.
- Support for configurable gate timing.

---

## 📚 Applications

- Intelligent Transportation Systems
- Smart Railway Infrastructure
- FPGA-Based Control Systems
- Digital Logic Design Education
- Embedded Control Applications

---

## 👨‍💻 Author

**Ashwin Ashok**

B.Tech Electronics and Communication Engineering

SRM Institute of Science and Technology

---

## 📜 License

This project is licensed under the MIT License.
