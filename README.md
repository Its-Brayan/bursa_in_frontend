# bursary_inn

A Flutter-based frontend application for managing bursary and scholarship workflows.

## Overview

`bursary_inn` is a mobile application built with Flutter, designed to support student bursary application flows, REST API authentication, notifications, and profile management. It uses modern Flutter packages like `provider` for state management and `flutter_secure_storage` for secure token storage.

## Key Features

- REST API authentication and verification flows
- Student detail gating: users can proceed to the home page only after completing required profile fields
- Bursary details and listing pages
- Secure local storage for tokens and user data
- Notification center and activity tracking
- Drawer-based navigation
- Supports Android, iOS, web, and desktop targets via Flutter

## Project Structure

- `lib/main.dart` — application entry point
- `lib/Screens/` — screen layouts and page definitions
- `lib/Models/` — data models used throughout the app
- `lib/Providers/` — app state and provider setup
- `lib/Services/` — API, authentication, and utility services
- `lib/Widgets/` — reusable UI components
- `Assets/` — images, icons, and app assets

## Dependencies

Notable dependencies included in `pubspec.yaml`:

- `provider` — state management
- `flutter_secure_storage` — secure key/value storage
- `http` — REST API requests
- `url_launcher` — opening external links
- `pinput` — OTP and pin input fields
- `flutter_slider_drawer` — side drawer navigation

## Getting Started

### Prerequisites

- Flutter SDK installed (Flutter 3.8 or newer recommended)
- Android Studio / Xcode / VS Code with Flutter support

### Run the app

From the project root:

```bash
flutter pub get
flutter run
```

To run on a specific platform:

```bash
flutter run -d chrome
flutter run -d android
flutter run -d ios
```

### Build for release

```bash
flutter build apk --split-per-abi
flutter build ios
flutter build web
```

## App Configuration

- Asset images are included under `Assets/`
- Launcher icon is configured in `pubspec.yaml` via `flutter_launcher_icons`
- Android minimum SDK is set to `21`

## Notes

- The project is configured as a private application with `publish_to: 'none'` in `pubspec.yaml`.
- If you add new assets, update the `assets` section in `pubspec.yaml`.
- Use `flutter analyze` and `flutter test` to validate code quality and behavior.

## Helpful commands

```bash
flutter pub get
flutter analyze
flutter test
flutter clean
```


