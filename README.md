# Digital Alarm System with Threshold Comparator

A MATLAB-based simulation of a **digital alarm monitoring system** that detects abnormal sensor readings using **comparator logic**.  
The system integrates **Python speech recognition** to enable voice-controlled monitoring of multiple rooms.

---

## Project Overview

This project simulates a real-world **sensor monitoring system** used in industrial safety systems, smart buildings, and laboratories.

The system continuously monitors sensor readings and classifies them into:

- Normal
- Warning
- Critical

based on threshold comparator logic.

Voice commands allow users to:

- Start or stop monitoring
- Select a room to monitor
- Choose the type of visualization output.

---

## System Architecture

```
Sensor Data → Comparator Logic → Alarm Classification
                     ↓
              Visualization
                     ↓
        Voice Control Interface
           (Python + MATLAB)
```

---

## Features

- Comparator-based threshold detection
- Multi-room monitoring simulation
- Alarm classification:
  - Normal
  - Warning
  - Critical
- Voice-controlled interaction
- MATLAB data visualization
- MATLAB–Python integration

---

## Technologies Used

- MATLAB
- Python
- SpeechRecognition library
- MATLAB-Python interface

---

## Example Output

### Alarm Level Distribution

![Alarm Graph](results/alarm_bar_graph.png)

### Sensor Readings with Threshold Detection

![Sensor Plot](results/sensor_readings.png)

---

## How to Run

### 1 Install Python dependencies

```
pip install -r requirements.txt
```

### 2 Run MATLAB Script

Run the file:

```
matlab/digital_alarm_system.m
```

---

## Voice Commands

The system recognizes commands such as:

```
start
stop
room 1
room 2
sensor readings
bar graph
everything
```

---

## Applications

- Industrial monitoring systems
- Smart building automation
- Safety alarm systems
- IoT sensor monitoring

---

## Author

**Sarthak Tripathi**

BTech Electronics Engineering  
Jaypee Institute of Information Technology