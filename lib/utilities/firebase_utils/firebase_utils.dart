class FirebaseUtils {
  static String getFirebaseErrorStr(String errorMessage) {
    String originalString = errorMessage;
    print("Error Message: $errorMessage");

    // This regex pattern captures the text between "Firebase: " and the error code in parentheses.
    RegExp pattern = RegExp(r'Firebase: (.*?)(?=\s\()');
    Match? match = pattern.firstMatch(errorMessage);

    // If a match is found, return the captured group; otherwise, return the original error message
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!; // Returns the captured Firebase error message
    } else {
      print("Error second Message: $originalString");
      return originalString;
    }
  }

  static String getFirebaseErrorCode(String errorCode) {
    switch (errorCode) {
      case 'invalid-credential':
        return 'The email or password is invalid.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-not-found':
        return 'Error: No user found with this email.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'wrong-password':
        return 'Error: Incorrect password.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
