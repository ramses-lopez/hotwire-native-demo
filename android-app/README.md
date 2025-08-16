# Hotwire Native Android App

This is a prototype Android app that wraps a Rails web application using Hotwire Native.

## Setup Instructions

### Prerequisites
1. **Android Studio**: Download and install [Android Studio](https://developer.android.com/studio)
2. **JDK 17**: Ensure you have Java Development Kit 17 installed
3. **Rails App**: Have your Rails application ready with Hotwire/Turbo enabled

### Configuration

1. **Update the Rails App URL**: 
   - Open `app/src/main/java/com/example/hotwireapp/MainApplication.kt`
   - Replace `"https://your-rails-app.com"` with your actual Rails app URL
   
   - Open `app/src/main/java/com/example/hotwireapp/MainActivity.kt`
   - Replace `"https://your-rails-app.com"` with your actual Rails app URL

2. **For Development (localhost)**:
   - If testing with localhost, use `http://10.0.2.2:3000` for Android emulator
   - For physical device, use your computer's IP address: `http://YOUR_IP:3000`

### Building and Running

1. **Open in Android Studio**:
   ```bash
   cd /Users/ramses/code/mobile-app/android-app
   # Open Android Studio and select "Open an existing project"
   ```

2. **Sync Gradle**:
   - Android Studio will prompt to sync Gradle files
   - Click "Sync Now"

3. **Run the App**:
   - Connect an Android device or start an emulator
   - Click the "Run" button (green play icon) in Android Studio
   - Select your target device

### Rails App Requirements

Your Rails app should:
1. Have Turbo enabled
2. Be mobile-responsive
3. Include proper meta tags:
   ```html
   <meta name="viewport" content="width=device-width, initial-scale=1">
   ```

### Customization

#### App Name and Package
- Update `applicationId` in `app/build.gradle.kts`
- Update package name in all Kotlin files
- Update `app_name` in `app/src/main/res/values/strings.xml`

#### App Icon
- Replace placeholder icons in `app/src/main/res/mipmap-*` directories
- Use Android Studio's Image Asset Studio for generating icons

#### Native Screens
To add native Android screens for specific routes:
1. Create a new Fragment extending `TurboWebFragment`
2. Add `@HotwireDestinationDeepLink` annotation
3. Configure path patterns in your Rails app's path configuration

### Publishing to Google Play Store

1. **Generate Signed APK/Bundle**:
   - In Android Studio: Build → Generate Signed Bundle/APK
   - Choose Android App Bundle (AAB) for Play Store
   - Create or use existing keystore

2. **Prepare Store Listing**:
   - App name, description, screenshots
   - Privacy policy URL
   - Content rating questionnaire

3. **Upload to Play Console**:
   - Create app in Google Play Console
   - Upload AAB file
   - Complete store listing
   - Submit for review

### Troubleshooting

- **WebView not loading**: Check internet permission in AndroidManifest.xml
- **HTTPS issues**: For production, ensure valid SSL certificate
- **JavaScript not working**: Verify `javaScriptEnabled = true` in WebFragment

### Next Steps

1. Implement native navigation patterns
2. Add offline support with service workers
3. Implement push notifications
4. Add native authentication screens
5. Customize the loading states and error handling