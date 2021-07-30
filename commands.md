### Build APK

> Development

```sh
flutter build apk --debug --flavor development --target lib/main_development.dart
flutter build apk --release --flavor development --target lib/main_development.dart

flutter packages pub run build_runner watch --delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner clean

```

> Staging

```sh
flutter build apk --debug --flavor staging --target lib/main_staging.dart
flutter build apk --release --flavor staging --target lib/main_staging.dart
```

> Production

```sh
flutter build apk --debug --flavor production --target lib/main_production.dart
flutter build apk --release --flavor production --target lib/main_production.dart
```

### Build APK analyze

```sh
flutter build apk --release --flavor production --target lib/main_production.dart --target-platform android-arm64 --analyze-size
```

### Change package name

```bash
flutter pub run change_app_package_name:main com.new.package.name
```

### Gradlew sync

```bat
android\gradlew --refresh-dependencies
```
