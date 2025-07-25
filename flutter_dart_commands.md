# Useful Flutter and Dart Commands

## General Commands
- **Get dependencies**:
  ```bash
  flutter pub get
  ```
- **Clean the project**:
  ```bash
  flutter clean
  ```
- **Run the app**:
  ```bash
  flutter run
  ```
- **Build the app for release**:
  ```bash
  flutter build apk
  ```

## Build Runner Commands
- **Generate `.g.dart` files**:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- **Watch for changes and regenerate files**:
  ```bash
  flutter pub run build_runner watch --delete-conflicting-outputs
  ```

## Testing Commands
- **Run all tests**:
  ```bash
  flutter test
  ```
- **Run a specific test file**:
  ```bash
  flutter test test/widget_test.dart
  ```

## Formatting and Analysis
- **Format Dart code**:
  ```bash
  dart format .
  ```
- **Analyze the code**:
  ```bash
  flutter analyze
  ```

## Device and Emulator Commands
- **List connected devices**:
  ```bash
  flutter devices
  ```
- **Launch an emulator**:
  ```bash
  flutter emulators --launch <emulator_id>
  ```
- **List available emulators**:
  ```bash
  flutter emulators
  ```

## Publishing Commands
- **Build for iOS**:
  ```bash
  flutter build ios
  ```
- **Build for web**:
  ```bash
  flutter build web
  ```

## Miscellaneous Commands
- **Upgrade Flutter**:
  ```bash
  flutter upgrade
  ```
- **Check Flutter version**:
  ```bash
  flutter --version
  ```
- **Check Dart version**:
  ```bash
  dart --version
  ```

## Hive Commands
- **Generate Hive Type Adapters**:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- **Open a Hive box**:
  ```dart
  var box = await Hive.openBox('boxName');
  ```
- **Add data to a Hive box**:
  ```dart
  await box.put('key', 'value');
  ```
- **Retrieve data from a Hive box**:
  ```dart
  var value = box.get('key');
  ```
- **Delete data from a Hive box**:
  ```dart
  await box.delete('key');
  ```
