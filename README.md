# Hotwire Native Mobile App Demo

A demonstration of [Hotwire Native](https://native.hotwired.dev/) for iOS and Android, wrapping a Rails web application to create native mobile app experiences.

## 📱 Project Structure

This repository contains the Rails backend and both mobile apps:

```
.
├── rails-app/      # Rails 7 blog application with Hotwire
├── android-app/    # Android app using Hotwire Native
└── ios-app/        # iOS app using Hotwire Native
```

## 🚀 Quick Start

### Prerequisites

- Ruby 3.0+ (or system Ruby with sudo for gems)
- Android Studio (for Android development)
- Xcode 15+ (for iOS development)
- JDK 17
- Node.js (for Tailwind CSS in Rails)

### 1. Start the Rails Server

```bash
cd rails-app
bundle install
bundle exec rails db:create db:migrate
bundle exec rails server -b 0.0.0.0
```

The Rails app will be available at `http://localhost:3000`

### 2. Configure and Run the Mobile Apps

#### Android App
1. Open Android Studio
2. Open the `android-app` folder as a project
3. Update the Rails server URL in:
   - `android-app/app/src/main/java/com/example/hotwireapp/MainApplication.kt`
   - `android-app/app/src/main/java/com/example/hotwireapp/MainActivity.kt`
   
   Use:
   - `http://10.0.2.2:3000` for Android Emulator
   - `http://YOUR_COMPUTER_IP:3000` for physical device

4. Run the app on your device/emulator

#### iOS App
1. Open Xcode
2. Open `ios-app/HotwireApp.xcodeproj`
3. Update the Rails server URL in:
   - `ios-app/HotwireApp/Sources/SceneDelegate.swift` (line 5)
   
   Use:
   - `http://localhost:3000` for iOS Simulator
   - `http://YOUR_COMPUTER_IP:3000` for physical device

4. Run the app on your device/simulator

## 🎯 Features

### Rails App
- **Blog Posts**: Full CRUD operations
- **Comments**: Real-time updates with Turbo Streams
- **Responsive Design**: Tailwind CSS for mobile-first UI
- **Hotwire**: Turbo & Stimulus for SPA-like experience

### Android App
- **Hotwire Native**: Seamless web-to-native bridge
- **Native Navigation**: Android navigation patterns
- **WebView Integration**: Optimized for Turbo
- **Play Store Ready**: Configured for production deployment

### iOS App
- **Turbo iOS**: Native iOS navigation with web content
- **SwiftUI Ready**: Modern Swift architecture
- **Pull-to-Refresh**: Native iOS interactions
- **App Store Ready**: Configured for production deployment

## 📖 Documentation

- [Rails App Documentation](rails-app/README.md)
- [Android App Documentation](android-app/README.md)
- [iOS App Documentation](ios-app/README.md)
- [Hotwire Native Docs](https://native.hotwired.dev/)

## 🔧 Development Tips

### Testing on Physical Devices
1. Find your computer's IP: `ifconfig | grep "inet " | grep -v 127.0.0.1`
2. Start Rails with: `bundle exec rails server -b 0.0.0.0`
3. Update mobile apps to use `http://YOUR_IP:3000`

### Using ngrok for Remote Testing
1. Install ngrok: `brew install ngrok`
2. Start tunnel: `ngrok http 3000`
3. Use the HTTPS URL in your mobile apps

## 📱 Publishing to App Stores

### Google Play Store (Android)
1. Update `applicationId` in `android-app/app/build.gradle.kts`
2. Generate signed AAB in Android Studio
3. Upload to Google Play Console
4. Deploy your Rails app to a production server

### App Store (iOS)
1. Update Bundle Identifier in Xcode project settings
2. Archive and upload via Xcode
3. Submit for App Store review
4. Deploy your Rails app to a production server

## 🤝 Contributing

Feel free to open issues or submit pull requests!

## 📄 License

MIT License - feel free to use this for your own projects!

## 🙏 Acknowledgments

- [Hotwire](https://hotwired.dev/) - HTML over the wire
- [Hotwire Native](https://native.hotwired.dev/) - Native mobile apps with web technology
- Built with Rails 7, Turbo, Stimulus, and Tailwind CSS