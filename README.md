# CITRA-APP-OPERATION-BINER

A simple desktop application for practicing and demonstrating **binary image operations** in digital image processing. This GUI-based app allows users to load images, apply binary operations, and preview results easily.

## 📸 GUI Screenshot

Below is a preview of the application interface:

![GUI Screenshot](GUI-APLIKASI-BINER/Gui.png)

## ✨ Features

- User-friendly **Graphical User Interface (GUI)**.
- Load and process grayscale/binary images.
- Apply core binary image operations:
  - NOT
  - AND
  - OR
  - XOR
  - MASKING
- Real-time preview: original image & result displayed side-by-side.
- Great tool for students learning digital image processing concepts.

---

## 🔧 Operations Supported

| Operation | Description |
|----------|-------------|
| **NOT**  | Inverts each pixel (binary negation) |
| **AND**  | Combines two images using bitwise AND |
| **OR**   | Combines two images using bitwise OR |
| **XOR**  | Highlights differences using bitwise XOR |
| **MASKING** | Applies a mask image to another image, allowing only selected pixel regions to pass based on the mask (binary AND–based masking). |

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/sheiza31/CITRA-APP-OPERATION-BINER.git
````

2. Open the project in **MATLAB**.
3. Run the main GUI file:

   ```
   Biner_GUI.m
   ```
4. Use the GUI buttons to load images and apply binary operations.

---

## 🛠️ Requirements

* MATLAB with GUI support.
* Basic knowledge of image processing (grayscale, thresholding, etc).

---

## 📂 Project Structure

```
CITRA-APP-OPERATION-BINER/
│
├── Biner_GUI.m                 — Main MATLAB GUI logic
├── Biner_GUI.fig               — GUI layout file
├── GUI-APLIKASI-BINER/         — Folder containing GUI screenshots
│     └── Gui.png
│
├── LAPORAN PRAKTIKUM OPERASI BINER.pdf
└── README.md
