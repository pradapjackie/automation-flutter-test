# Simple Flutter App

A beautiful, modern Flutter application that works seamlessly on both mobile and web platforms.

## Features

- ✨ Modern Material Design 3 UI
- 🌈 Beautiful gradient background
- 📱 Responsive design for mobile and web
- 🎭 Smooth animations and transitions
- 🔢 Interactive counter with beautiful buttons
- 📊 Platform information display
- 🎨 Beautiful cards with shadows and rounded corners
- 📱 Bottom navigation bar
- 🌐 Cross-platform compatibility

## Screenshots

The app features:
- Welcome card with friendly greeting
- Feature grid showing platform support
- Interactive counter with increment/decrement buttons
- Platform information display
- Responsive layout that adapts to screen size

## Getting Started

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or your preferred IDE

### Installation

1. Clone or download this project
2. Navigate to the project directory:
   ```bash
   cd simple_flutter_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

## Running the App

### Web Platform

To run the app in your web browser:

```bash
flutter run -d chrome
```

Or for any available web browser:
```bash
flutter run -d web-server
```

### Mobile Platform

#### Android

1. Connect an Android device or start an emulator
2. Run the app:
   ```bash
   flutter run
   ```

#### iOS

1. Connect an iOS device or start a simulator
2. Run the app:
   ```bash
   flutter run
   ```

### Desktop Platforms

#### macOS
```bash
flutter run -d macos
```

#### Windows
```bash
flutter run -d windows
```

#### Linux
```bash
flutter run -d linux
```

## Building for Production

### Web
```bash
flutter build web
```

### Android APK
```bash
flutter build apk
```

### Android App Bundle
```bash
flutter build appbundle
```

### iOS
```bash
flutter build ios
```

## Project Structure

```
lib/
├── main.dart          # Main application entry point
└── ...

android/               # Android-specific configuration
ios/                  # iOS-specific configuration
web/                  # Web-specific configuration
windows/              # Windows-specific configuration
macos/                # macOS-specific configuration
linux/                # Linux-specific configuration
```

## Key Features Explained

### Responsive Design
The app automatically adapts its layout based on screen size:
- Mobile: 2-column grid for features
- Web/Desktop: 3-column grid for features

### Platform Detection
The app detects the current platform and displays relevant information:
- Screen dimensions
- Pixel density
- Orientation
- Platform type

### Modern UI Components
- Material Design 3 components
- Beautiful gradient backgrounds
- Card-based layout with shadows
- Smooth animations and transitions

## Customization

You can easily customize the app by:
- Changing colors in the `ColorScheme`
- Modifying the gradient colors
- Adding new feature cards
- Customizing the counter functionality
- Adding new navigation items

## Troubleshooting

### Common Issues

1. **Dependencies not found**: Run `flutter pub get`
2. **Platform not supported**: Ensure you have the required SDKs installed
3. **Build errors**: Check Flutter and Dart versions compatibility

### Getting Help

- Check the [Flutter documentation](https://docs.flutter.dev/)
- Visit [Flutter community](https://flutter.dev/community)
- Check [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

## License

This project is open source and available under the [MIT License](LICENSE).

## Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Submitting pull requests
- Improving documentation

---

**Happy Fluttering! 🚀**
