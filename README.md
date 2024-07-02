# Flutter Pet Health App

A Flutter application to help you keep your pet healthy. This project uses Firebase for authentication and GoRouter for routing.

##Screenshots

<p float="left">
  <img src="https://github.com/AaryanRaj01/amologic_assign/assets/99470935/0b04d3f4-fe4c-4088-b772-654ef989eac4" width="200" /> 
  <img src="https://github.com/AaryanRaj01/amologic_assign/assets/99470935/8a14325c-5f2a-4b92-bac3-2ea006db2c56" width="200" />
  <img src="https://github.com/AaryanRaj01/amologic_assign/assets/99470935/d9ab7fe6-da03-4964-9fd4-55eecfbf2408" width="200" />
  <img src="https://github.com/AaryanRaj01/amologic_assign/assets/99470935/38ce0a08-2bf5-4189-86c0-d6bf49c1863f" width="200" />
</p>

## Features

- Splash Screen
- Login Screen
- Home Screen
- Details Screen
- Firebase Authentication (Google Login)
- Clean Architecture
- Routing with GoRouter

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Project: [Set up Firebase](https://firebase.google.com/docs/flutter/setup)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/flutter-pet-health-app.git
   cd flutter-pet-health-app
  Install dependencies:

    ```bash
    Copy code
    flutter pub get
2. Set up Firebase:
- Create a Firebase project.
- Add your Flutter app to the Firebase project.
- Download the google-services.json file for Android and place it in the android/app directory.
- Download the GoogleService-Info.plist file for iOS and place it in the ios/Runner directory.
- Generate the firebase_options.dart file using the flutterfire CLI:

     ```bash
     Copy code
     flutter pub global activate flutterfire_cli
     flutterfire configure
3. Run the app:

    ```bash
    Copy code
   flutter run
