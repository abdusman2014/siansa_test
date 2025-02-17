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
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
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
    // apiKey: 'AIzaSyDsxZh3EyfTEWgnRvA-MY-MNFEn4sqh5dk',
    // appId: '1:1059320284686:web:35a9fd319d4a74eaeb5e5f',
    // messagingSenderId: '1059320284686',
    // projectId: 'blukers-app',
    // authDomain: 'blukers-app.firebaseapp.com',
    // databaseURL: 'https://blukers-app-default-rtdb.firebaseio.com',
    // storageBucket: 'blukers-app.appspot.com',
    // measurementId: 'G-G3TKEV6S86',
    apiKey: "AIzaSyA22mqaAmc07ak42xl2sbrwVQ2DStLFuqM",
    authDomain: "siansa-dev.firebaseapp.com",
    projectId: "siansa-dev",
    storageBucket: "siansa-dev.appspot.com",
    messagingSenderId: "608897446054",
    appId: "1:608897446054:web:e378af893c2cae50a94467",
    measurementId: "G-407XK2RHFW",
    databaseURL: "https://siansa-dev-default-rtdb.firebaseio.com/",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfwHJKrFYuKK2KMFKj81rKpWq2PFTnxE8',
    appId: '1:608897446054:android:4415674a69fb106ca94467',
    messagingSenderId: '',
    projectId: 'siansa-app',
    databaseURL: 'https://siansa-dev-default-rtdb.firebaseio.com',
    storageBucket: 'siansa-dev.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   // apiKey: 'AIzaSyB50wjWkOigQ6ZATZDz-Jt2hRHjUZmCEdU',
  //   // appId: '1:1059320284686:ios:80e0550170973d20eb5e5f',
  //   // messagingSenderId: '1059320284686',
  //   // projectId: 'blukers-app',
  //   // databaseURL: 'https://blukers-app-default-rtdb.firebaseio.com',
  //   // storageBucket: 'blukers-app.appspot.com',
  //   // iosClientId:
  //   //     '1059320284686-h4j3nd86vdgrj9sfg6s6ed8tepsditfd.apps.googleusercontent.com',
  //   // iosBundleId: 'com.terralabor.blukers',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   // apiKey: 'AIzaSyB50wjWkOigQ6ZATZDz-Jt2hRHjUZmCEdU',
  //   // appId: '1:1059320284686:ios:a28d95c410ecb55eeb5e5f',
  //   // messagingSenderId: '1059320284686',
  //   // projectId: 'blukers-app',
  //   // databaseURL: 'https://blukers-app-default-rtdb.firebaseio.com',
  //   // storageBucket: 'blukers-app.appspot.com',
  //   // iosClientId:
  //   //     '1059320284686-69pu9b94ii0d2eq348ogo25aehl3fivj.apps.googleusercontent.com',
  //   // iosBundleId: 'com.terralabor.blukers.RunnerTests',
  // );
}
