# assignment_wijungle

## [![Project Walkthrough](https://img.youtube.com/vi/mt-8j0wgWDs/maxresdefault.jpg)](https://youtu.be/mt-8j0wgWDs)

## Overview

This project is designed to monitor and display live CPU and RAM usage on a Windows machine. The project consists of two main components:

1. C++ Windows Service: This service is responsible for fetching CPU and RAM data from the machine and serving it to the Flutter app.
2. Flutter App: This app interfaces with the C++ service to display the live CPU and RAM usage data, updating every 5 seconds.

## Components

### 1. C++ Windows Service

- **Service Creation**: The service is developed using C++ and is installed on the same machine as the Flutter app.
- **Data Fetching**: The service fetches CPU and RAM usage data from the system.
- **WebSocket Communication**: The service uses Boost libraries to create a WebSocket on localhost, which sends the data to the Flutter app in real-time.

### 2. Flutter App

- **Login Screen**: The app includes a login screen. After successful authentication, the app navigates to the dashboard.
- **Dashboard**: The dashboard displays live CPU and RAM usage data fetched from the C++ service. The data is updated every 5 seconds to ensure real-time monitoring.
- **Responsiveness**: The app is designed to be responsive and adapt to different window sizes, providing an optimal user experience across various screen resolutions.

## Features

1. **Live Data Display**: The app displays live CPU and RAM usage data that updates every 5 seconds.
2. **WebSocket Communication**: The app receives data via a WebSocket connection established by the C++ service, ensuring low-latency updates.
3. **Cross-Platform Development**: The service is developed using C++ for Windows, and the frontend is developed using Flutter.

## Figma Design

- The design of the app is based on the specifications provided in a Figma document. Ensure that the final implementation closely matches the design expectations.

## Expectations

- **Code Quality**: Include proper comments in your code to explain the logic and flow.
- **Responsiveness**: Ensure the Flutter app is responsive and works well across different window sizes.
- **Functionality**: Implement all required features correctly, including login, data fetching, and live updates.
- **Development Platform**: Develop the entire software on a Windows environment to ensure compatibility and performance.

## Libraries and Tools Used

- **C++**: Used for developing the Windows service.
- **Boost Libraries**: Used for creating the WebSocket on localhost to send data to the Flutter app.
- **Flutter**: Used for developing the cross-platform frontend of the app.
- **Provider Package**: Used for state management in the Flutter app.
- **SharedPreferences**: Used for managing local storage and authentication states in Flutter.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure Flutter is installed on your machine.
- **C++ Compiler**: Required for building the Windows service.
- **Boost Libraries**: Required for WebSocket communication.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/assignment_wijungle.git
   cd assignment_wijungle
   ```

2. **Build the C++ Service**:
   - Navigate to the C++ service directory.
   - Compile and install the service using your preferred C++ compiler.

3. **Run the Flutter App**:
   ```bash
   flutter run
   ```

### Usage

1. **Start the C++ Service**: Ensure the service is running on your machine.
2. **Login to the Flutter App**: Open the app and log in.
3. **View Live Data**: After logging in, you will see live CPU and RAM usage data on the dashboard.

## Conclusion

This project provides a robust solution for monitoring system performance in real-time using a combination of C++ for backend services and Flutter for the frontend. The integration of WebSocket communication ensures that the data is live and updated every 5 seconds, providing an accurate and responsive user experience.

