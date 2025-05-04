# img_extractor

A Flutter application designed to pick images from the device gallery or camera and display their EXIF (Exchangeable image file format) metadata.

## Overview

This project demonstrates how to:
- Use the `image_picker` package to select images from the gallery or capture new ones using the camera across multiple platforms (Android, iOS, Web).
- Extract and display EXIF metadata from the selected images using the `flutter_exif_rotation` package (primarily for orientation, but can be adapted for more data).
- Provide a user-friendly interface to view the image and its associated metadata.

## Features

- **Cross-Platform Image Picking:** Select images from the gallery or camera on Android, iOS, and Web.
- **Metadata Display:** Shows available EXIF metadata for the selected image.
- **Simple UI:** Clean interface for image preview and metadata presentation.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- An editor like VS Code or Android Studio with the Flutter plugin.
- A device or emulator/simulator for testing.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mohamadElEaswy/img_metadata.git
    cd img_extractor
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

### Running the Application

1.  **Connect a device or start an emulator/simulator.**
2.  **Run the app:**
    ```bash
    flutter run
    ```

#### Platform Specific Setup

**iOS:**

Ensure you add the necessary keys to your `ios/Runner/Info.plist` file to request permissions for camera and photo library access:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photo library to select images.</string>
<key>NSCameraUsageDescription</key>
<string>This app needs access to your camera to take pictures.</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone for video recording (if applicable, though not used in this specific example).</string>
```

**Android:**

No specific setup is usually required beyond the standard Flutter project setup for Android. Permissions are typically handled by the `image_picker` package.

**Web:**

The web version works out of the box for selecting files.

## Project Structure

```
lib/
├── home.dart             # Main screen widget
├── main.dart             # Application entry point
├── utils/
│   └── exif_helpers.dart # Helper functions for EXIF data (if needed)
└── widgets/
    ├── error_message.dart    # Widget to display errors
    ├── image_display.dart    # Widget to show the selected image
    ├── metadata_display.dart # Widget to display image metadata
    └── placeholder_message.dart # Widget for initial/empty state
```

## Dependencies

- `flutter/material.dart`: Flutter's Material Design library.
- `image_picker`: For picking images from gallery/camera.
- `flutter_exif_rotation`: For reading EXIF orientation data (can be expanded).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details (if applicable).
