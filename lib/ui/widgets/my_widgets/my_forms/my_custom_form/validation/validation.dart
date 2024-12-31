// class Validation {
//   String? validateEmail(value) {
//     value = value.toString();
//     Pattern pattern =
//         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//         r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//         r"{0,253}[a-zA-Z0-9])?)*$";
//     RegExp regex = RegExp(pattern.toString());
//     if (!regex.hasMatch(value) || value == null) {
//       return "Enter A Valid Email Address";
//     } else {
//       return null;
//     }
//   }
// }

// class Validation {
//   String? validateRequiredField(value) {
//     if (value == null || value.toString().trim().isEmpty) {
//       return "This field is required";
//     } else {
//       return null;
//     }
//   }

//   String? validateEmail(value) {
//     if (value == null || value.isEmpty) {
//       return "Email address is required"; // Check for null or empty value
//     }

//     String email = value.toString();
//     String pattern =
//         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";

//     RegExp regex =
//         RegExp(pattern); // RegExp regex = RegExp(pattern.toString());

//     if (!regex.hasMatch(email)) {
//       return "Enter a valid email address";
//     } else {
//       return null;
//     }
//   }

//   String? validatePhoneNumber(value) {
//     if (value == null || value.isEmpty) {
//       return "Phone number is required";
//     }

//     String phonePattern = r'^\+?([0-9]{1,3})?[-.\s]?([0-9]{10})$';
//     RegExp regex = RegExp(phonePattern);

//     if (!regex.hasMatch(value.toString())) {
//       return "Enter a valid phone number";
//     } else {
//       return null;
//     }
//   }

//   String? validateTextOnly(value) {
//     if (value == null || value.isEmpty) {
//       return "This field is required";
//     }

//     String textPattern = r'^[a-zA-Z\s]+$';
//     RegExp regex = RegExp(textPattern);

//     if (!regex.hasMatch(value.toString())) {
//       return "Only alphabetic characters are allowed";
//     } else {
//       return null;
//     }
//   }

//   String? validateUpperAndLowerCase(value) {
//     if (value == null || value.isEmpty) {
//       return "This field is required";
//     }

//     String upperLowerPattern = r'^(?=.*[a-z])(?=.*[A-Z]).+$';
//     RegExp regex = RegExp(upperLowerPattern);

//     if (!regex.hasMatch(value.toString())) {
//       return "Must contain at least one uppercase and one lowercase letter";
//     } else {
//       return null;
//     }
//   }

//   String? validateNoSpecialCharacters(value) {
//     if (value == null || value.isEmpty) {
//       return "This field is required";
//     }

//     String noSpecialCharsPattern = r'^[a-zA-Z0-9\s]+$';
//     RegExp regex = RegExp(noSpecialCharsPattern);

//     if (!regex.hasMatch(value.toString())) {
//       return "No special characters are allowed";
//     } else {
//       return null;
//     }
//   }

//   String? validatePasswordStrength(value) {
//     if (value == null || value.isEmpty) {
//       return "Password is required";
//     }

//     String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
//     RegExp regex = RegExp(passwordPattern);

//     if (!regex.hasMatch(value.toString())) {
//       return "Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number";
//     } else {
//       return null;
//     }
//   }

//   // validation function to check string length

//   String? validateMinLength(String value, int minLength) {
//     if (value.length < minLength) {
//       return "This field must be greater than or equal to $minLength characters";
//     } else {
//       return null;
//     }
//   }

//   String? validateMaxLength(String value, int maxLength) {
//     if (value.length > maxLength) {
//       return "This field must be less than or equal to $maxLength characters";
//     } else {
//       return null;
//     }
//   }

//   String? validateExactLength(String value, int exactLength) {
//     if (value.length != exactLength) {
//       return "This field must have $exactLength characters";
//     } else {
//       return null;
//     }
//   }
// }

class Validation {
  dynamic isRequiredFieldOk(value) {
    if (value == null || value.toString().trim().isEmpty) {
      return "This field is required";
    } else {
      return true;
    }
  }

  dynamic isEmail(value) {
    if (value == null || value.isEmpty) {
      return "Email address is required"; // Check for null or empty value
    }

    String email = value.toString();
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";

    RegExp regex =
        RegExp(pattern); // RegExp regex = RegExp(pattern.toString());

    if (!regex.hasMatch(email)) {
      return "Enter a valid email address";
    } else {
      return true;
    }
  }

  dynamic isPhoneNumber(value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    String phonePattern = r'^\+?([0-9]{1,3})?[-.\s]?([0-9]{10})$';
    RegExp regex = RegExp(phonePattern);

    if (!regex.hasMatch(value.toString())) {
      return "Enter a valid phone number";
    } else {
      return true;
    }
  }

  dynamic isTextOnly(value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    String textPattern = r'^[a-zA-Z\s]+$';
    RegExp regex = RegExp(textPattern);

    if (!regex.hasMatch(value.toString())) {
      return "Only alphabetic characters are allowed";
    } else {
      return true;
    }
  }

  dynamic isUpperAndLowerCase(value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    String upperLowerPattern = r'^(?=.*[a-z])(?=.*[A-Z]).+$';
    RegExp regex = RegExp(upperLowerPattern);

    if (!regex.hasMatch(value.toString())) {
      return "Must contain at least one uppercase and one lowercase letter";
    } else {
      return true;
    }
  }

  dynamic hasNoSpecialCharacters(value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }

    String noSpecialCharsPattern = r'^[a-zA-Z0-9\s]+$';
    RegExp regex = RegExp(noSpecialCharsPattern);

    if (!regex.hasMatch(value.toString())) {
      return "No special characters are allowed";
    } else {
      return true;
    }
  }

  dynamic isPasswordStrengthOk(value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
    RegExp regex = RegExp(passwordPattern);

    if (!regex.hasMatch(value.toString())) {
      return "Password must be at least 8 characters, include an uppercase letter, a lowercase letter, and a number";
    } else {
      return true;
    }
  }

  // validation function to check string length

  dynamic isMinLengthOk(String value, int minLength) {
    if (value.length < minLength) {
      return "This field must be greater than or equal to $minLength characters";
    } else {
      return true;
    }
  }

  dynamic isMaxLengthOk(String value, int maxLength) {
    if (value.length > maxLength) {
      return "This field must be less than or equal to $maxLength characters";
    } else {
      return true;
    }
  }

  dynamic isExactLengthOk(String value, int exactLength) {
    if (value.length != exactLength) {
      return "This field must have $exactLength characters";
    } else {
      return true;
    }
  }
}
