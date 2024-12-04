# MiniGold VHDL Project

## Overview

This project is a classic **MiniGold** game implemented using **VHDL**. The game utilizes a **Nintendo Nunchuck** as a controller and outputs the game display via a **VGA monitor**, all running on an **FPGA** platform. The objective of the game is to guide a golf ball to the hole, avoiding obstacles, using precise movement from the Nunchuck.

---

## Features

- **Controller Input:** Supports a Nintendo Nunchuck for interactive control.
- **Game Display:** Outputs graphics to a VGA display.
- **Real-Time Feedback:** Smooth player input and dynamic VGA rendering.
- **Customizable Gameplay:** Modular design allows for extensions or customizations.

---

## Hardware Requirements

1. **FPGA Board** (e.g., Xilinx or Intel/Altera-based FPGA).
2. **Nintendo Nunchuck** connected via I2C interface.
3. **VGA-compatible monitor** for game display.
4. Power supply and appropriate cables.

---

## Project Components

### 1. **I2C Controller (Nunchuck Input)**
   - Manages communication with the Nintendo Nunchuck.
   - Reads joystick, button inputs (`Z` and `C`), and accelerometer data.
   - Translates Nunchuck data into movement commands for the game.

### 2. **VGA Controller**
   - Drives the VGA display.
   - Handles pixel clock synchronization, horizontal and vertical sync signals.
   - Renders the game graphics (ball, hole, obstacles, and background).

### 3. **Game Logic**
   - Processes player input to update ball position.
   - Checks collisions with obstacles and boundary conditions.
   - Detects when the ball reaches the hole to win.

### 4. **FPGA Top Module**
   - Integrates all submodules (I2C, VGA, Game Logic).
   - Manages clock domains and synchronization.

---

## Setup Instructions

1. **Clone the Project:**
   ```bash
   git clone https://github.com/Jet4stream/Minigolf-Project.git
