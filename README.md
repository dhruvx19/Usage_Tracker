# assignment_wijungle

<p align="center">
  <a href="https://youtu.be/emGc2ufve9w">Project Walkthrough</a>
</p>

## [![Project Walkthrough](https://img.youtube.com/vi/emGc2ufve9w/maxresdefault.jpg)](https://youtu.be/emGc2ufve9w)

<p align="center">
  <a href="https://youtu.be/mt-8j0wgWDs">Code Walkthrough</a>
</p>

<p align="center">
  <a href="https://youtu.be/mt-8j0wgWDs">
    <img src="https://img.youtube.com/vi/mt-8j0wgWDs/maxresdefault.jpg" alt="Code Walkthrough" width="400"/>
  </a>
</p>

<a href="https://1drv.ms/f/s!AkdHHf-r9PalbFr0KDAGJWpjMH8?e=O912pd">C++ Software Link</a>.
## Overview

This project is designed to monitor and display live CPU and RAM usage on a Windows machine. The project consists of two main components:

### Components

1. **C++ Windows Service**: This service is responsible for fetching CPU and RAM data from the machine and serving it to the Flutter app. It uses WebSocket for communication and relies on the Boost library for handling network operations and other functionalities. The service is built using Visual Studio by Microsoft.

2. **Flutter App**: This app interfaces with the C++ service to display live CPU and RAM usage data, updating every 5 seconds. The app connects to the C++ service via WebSocket to receive real-time updates.


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

Here’s the installation guide formatted for a GitHub README:


### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/assignment_wijungle.git
   cd assignment_wijungle
   ```

2. **Build the C++ Service**:
   - Navigate to the C++ service directory.
   - Open the project in Visual Studio by Microsoft.
   - Ensure that the Boost libraries are properly installed.
   - Build the project to compile the service.
   - Run the WebSocket on localhost to start the service.

   Alternatively, you can download the pre-built C++ service from this <a href="https://1drv.ms/f/s!AkdHHf-r9PalbFr0KDAGJWpjMH8?e=O912pd">C++ Software Link</a>. Note that running the executable file alone may require you to install the necessary Boost packages if they are not already present on your system.

3. **Run the Flutter App**:
   ```bash
   flutter run
   ```


This version is ready to be included in your GitHub README file.

### Usage

1. **Start the C++ Service**: Ensure the service is running on your machine.
2. **Login to the Flutter App**: Open the app and log in.
3. **View Live Data**: After logging in, you will see live CPU and RAM usage data on the dashboard.

## Conclusion

This project provides a robust solution for monitoring system performance in real-time using a combination of C++ for backend services and Flutter for the frontend. The integration of WebSocket communication ensures that the data is live and updated every 5 seconds, providing an accurate and responsive user experience.

