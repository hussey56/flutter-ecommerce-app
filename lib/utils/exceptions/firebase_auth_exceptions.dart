class HFirebaseAuthException implements Exception {
  final String code;

  HFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The e-mail address is already registered. Please use a different email';
      case 'invalid-email':
        return 'The e-mail address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return "This password is too weak. Please choose a stronger password";
      case 'user-disabled':
        return "This user account has been disabled. Please contact support for assistance";
      case 'user-not-found':
        return "Invalid Login details. User not found.";
      case 'wrong-password':
        return "Incorrect password. Please check your password and try again";
      case 'invalid-verification-code':
        return "Invalid Verfication code. Please enter a valid code.";
      case 'invalid-verification-id':
        return "Invalid Verfifaction Id. Please request a new verification code";
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later";
      case 'email-already-exist':
        return "The email address is already in use. Please use a different email";
      default:
        return "Something went wrong with authentication";
    }
  }
}
