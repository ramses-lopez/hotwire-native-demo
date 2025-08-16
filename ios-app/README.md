# Hotwire Native iOS App

This is an iOS app that wraps a Rails web application using Hotwire Native (formerly Turbo Native).

## Features

- 📱 Native iOS navigation with web content
- 🔄 Pull-to-refresh support
- 🎯 Modal presentation for forms
- 🌐 WebView-based with native controls
- 🚀 App Store ready configuration

## Requirements

- Xcode 15.0+
- iOS 15.0+ deployment target
- Swift 5.9+
- CocoaPods or Swift Package Manager

## Setup Instructions

### 1. Open in Xcode

```bash
cd ios-app
open HotwireApp.xcodeproj
```

### 2. Install Dependencies

The project uses Swift Package Manager for dependencies. When you open the project in Xcode:

1. Xcode will automatically resolve the package dependencies
2. If not, go to **File → Packages → Resolve Package Versions**

### 3. Configure the Rails Server URL

Update the base URL in `Sources/SceneDelegate.swift:5`:

```swift
let baseURL = URL(string: "https://your-rails-app.com")!
```

For local development:
- **iOS Simulator**: Use `http://localhost:3000`
- **Physical Device**: Use `http://YOUR_COMPUTER_IP:3000`

### 4. Run the App

1. Select your target device (simulator or connected iPhone/iPad)
2. Press **Cmd+R** or click the Run button
3. The app should launch and load your Rails application

## Project Structure

```
ios-app/
├── HotwireApp/
│   ├── Sources/
│   │   ├── AppDelegate.swift       # App lifecycle
│   │   └── SceneDelegate.swift     # Scene management & Hotwire setup
│   ├── Resources/
│   │   ├── Assets.xcassets/        # App icons and colors
│   │   └── path-configuration.json # Hotwire routing rules
│   ├── Base.lproj/
│   │   └── LaunchScreen.storyboard # Launch screen
│   └── Info.plist                   # App configuration
├── HotwireApp.xcodeproj/           # Xcode project file
└── Package.swift                    # Swift Package Manager config
```

## Hotwire Configuration

### Path Configuration

The app uses `path-configuration.json` to define navigation rules:

- Forms (`/new`, `/edit`) open as modals
- Root and posts index support pull-to-refresh
- All other paths use standard push navigation

### Customization

You can customize the navigation behavior by editing:
- `Resources/path-configuration.json` - Navigation rules
- `SceneDelegate.swift` - Session configuration and error handling

## Testing on Different Environments

### Local Development

1. Start your Rails server:
   ```bash
   cd ../rails-app
   bundle exec rails server
   ```

2. Run the iOS app in the simulator

### Using ngrok for Physical Device Testing

1. Install ngrok: `brew install ngrok`
2. Start tunnel: `ngrok http 3000`
3. Update `baseURL` in `SceneDelegate.swift` with the ngrok URL
4. Run on physical device

## Building for App Store

### 1. Update Bundle Identifier

In Xcode, select your project and update:
- Bundle Identifier (e.g., `com.yourcompany.hotwireapp`)
- Version and Build numbers

### 2. Configure Signing

1. Select your Apple Developer Team
2. Enable "Automatically manage signing"
3. Ensure provisioning profiles are configured

### 3. Archive and Upload

1. Select "Any iOS Device" as the target
2. Product → Archive
3. Distribute App → App Store Connect
4. Upload to App Store Connect

## Troubleshooting

### App Transport Security

For development with HTTP URLs, the Info.plist includes:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

**Important**: Remove or restrict this for production apps!

### WebView Not Loading

- Check network connection
- Verify Rails server is running
- Ensure URL is correct in SceneDelegate
- Check console for error messages

### Navigation Issues

- Review path-configuration.json rules
- Check that Turbo is properly configured in Rails
- Ensure all links use data-turbo attributes correctly

## Next Steps

1. **Add Native Screens**: Create Swift ViewControllers for specific routes
2. **Push Notifications**: Integrate with Apple Push Notification Service
3. **Authentication**: Implement native login screens
4. **Offline Support**: Add caching and offline fallbacks
5. **Analytics**: Integrate analytics SDK

## Resources

- [Hotwire Native iOS Documentation](https://native.hotwired.dev/ios)
- [Turbo iOS GitHub](https://github.com/hotwired/turbo-ios)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)

## License

MIT License - See main repository README for details