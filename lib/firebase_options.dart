// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1boLKspYLDmw9cRcJK2QHRPmm1mxd4Zw',
    appId: '1:835266895679:web:66c5e31c07f96d52267d8a',
    messagingSenderId: '835266895679',
    projectId: 'pokedex-flutter-bc673',
    authDomain: 'pokedex-flutter-bc673.firebaseapp.com',
    storageBucket: 'pokedex-flutter-bc673.appspot.com',
    measurementId: 'G-BT5P2D9FCW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_IWPNEx0mQO4lL-8-GmSBaxFqkMRpvog',
    appId: '1:835266895679:android:74fa744ef4046b0f267d8a',
    messagingSenderId: '835266895679',
    projectId: 'pokedex-flutter-bc673',
    storageBucket: 'pokedex-flutter-bc673.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYChyK2pd-pfb_YQOMgAfHEaDGul7EN0Q',
    appId: '1:835266895679:ios:dbb95abe05740d7d267d8a',
    messagingSenderId: '835266895679',
    projectId: 'pokedex-flutter-bc673',
    storageBucket: 'pokedex-flutter-bc673.appspot.com',
    iosClientId: '835266895679-vgsh9mm01pohnlp51ogmblb6j6jqmtcv.apps.googleusercontent.com',
    iosBundleId: 'com.example.practica3Julio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYChyK2pd-pfb_YQOMgAfHEaDGul7EN0Q',
    appId: '1:835266895679:ios:3f1ca3e9544bf689267d8a',
    messagingSenderId: '835266895679',
    projectId: 'pokedex-flutter-bc673',
    storageBucket: 'pokedex-flutter-bc673.appspot.com',
    iosClientId: '835266895679-uupiria46jo38cka76flglose7usgk5b.apps.googleusercontent.com',
    iosBundleId: 'com.example.practica3Julio.RunnerTests',
  );
}
