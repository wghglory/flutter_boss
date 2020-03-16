# flutter_boss

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## [Package for android](https://flutterchina.club/android-release/)

1. Generate key:

   ```bash
   keytool -genkey -v -keystore /Volumes/Work/My/flutter_boss/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
   ```

   ```
   Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10,000 days
           for: CN=Derek Wang, OU=VMware, O=VMware, L=Shanghai, ST=Shanghai, C=CN
   ```

1. 创建 key.properties

   ```
   storePassword=123456
   keyPassword=123456
   keyAlias=key
   storeFile=/Volumes/Work/My/flutter_boss/
   ```

1. modify app/build.gradle

   add below before "android {":

   ```
   def keystorePropertiesFile = rootProject.file("key.properties")
   def keystoreProperties = new Properties()
   keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

   android {

   }
   ```

   add signingConfigs and update "buildTypes {" with below release info:

   ```diff
   signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }

   buildTypes {
      release {
          // TODO: Add your own signing config for the release build.
          // Signing with the debug keys for now, so `flutter run --release` works.
          // buildTypes 中从 debugger 改成 release
    -     signingConfig signingConfigs.debug
    +     signingConfig signingConfigs.release
      }
   }
   ```

1. run `flutter build apk`

1. You could see `✓ Built build/app/outputs/apk/release/app-release.apk (18.7MB).`
