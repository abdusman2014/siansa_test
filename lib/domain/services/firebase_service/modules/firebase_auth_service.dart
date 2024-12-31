// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> registerWithEmail(String email, String password) async {
//     try {
//       final UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (error) {
//       throw Exception('Error registering user: ${error.toString()}');
//     }
//   }

//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (error) {
//       throw Exception('Error signing in: ${error.toString()}');
//     }
//   }

//   User? getCurrentUser() {
//     try {
//       return _auth.currentUser;
//     } catch (error) {
//       throw Exception('Error fetching current user: ${error.toString()}');
//     }
//   }

//   Future<void> resetPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } catch (error) {
//       throw Exception('Error resetting password: ${error.toString()}');
//     }
//   }

//   Future<void> sendEmailVerification() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null && !user.emailVerified) {
//         await user.sendEmailVerification();
//       }
//     } catch (error) {
//       throw Exception('Error sending email verification: ${error.toString()}');
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (error) {
//       throw Exception('Error signing out: ${error.toString()}');
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> registerWithEmail(
    String email,
    String password,
  ) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<UserCredential?> signInWithEmail(
    String email,
    String password,
  ) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
