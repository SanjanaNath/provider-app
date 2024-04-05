import 'package:intl/intl.dart';

class Validator {
  /// Name Validator.

  static String? nameValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Name'} is required';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Please enter a valid ${fieldName ?? 'name'}';
    }
    return null;
  }

  ///Full Name
  static String? fullNameValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Full name'} is required';
    }
    final parts = value.split(' ');
    if (parts.length < 2) {
      return 'Please enter your ${fieldName ?? 'full name'}';
    }

    for (var part in parts) {
      if (part.length < 2) {
        return 'Each word in your ${fieldName ?? 'full name'} must be at least 2 characters long';
      }
      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(part)) {
        return 'Please enter a valid ${fieldName ?? 'full name'}';
      }
    }
    return null;
  }

  /// UserName Validator.
  static String? userNameValidator(String? value, {int minLength = 3, int maxLength = 30}) {
    if (value?.isEmpty == true) {
      return 'Username is required';
    }

    final usernameRegExp = RegExp(r'^[a-z][a-z\d._]{1,28}[a-z\d]$');
    if (!usernameRegExp.hasMatch(value!)) {
      if (!RegExp(r'^[a-z]').hasMatch(value)) {
        return 'Username must start with a letter (a-z)';
      } else if (!RegExp(r'[a-z\d]$').hasMatch(value)) {
        return 'Username must end with a letter or a number';
      } else if (!RegExp(r'^[a-z][a-z\d._]*[a-z\d]$').hasMatch(value)) {
        return 'Username can only contain (a-z), (0-9), (.), (_)';
      } else if (value.length < minLength || value.length > maxLength) {
        return 'The username must be between $minLength and $maxLength characters long';
      } else {
        return 'Invalid username';
      }
    }

    return null;
  }

  /// Validates that a value is not null or empty.
  static String? requiredValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }
    return null;
  }

  /// Validates that an email has a valid format.
  static String? emailValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Email'} is Required';
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid ${fieldName ?? 'email'} format';
    }
    return null;
  }

  /// Validates that a value is a valid number format.
  static String? phoneNumberValidator(
    String? value,
    int limit, [
    String? fieldName,
  ]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Number'} is required';
    }

    if (value.length < limit) {
      return 'Complete ${fieldName ?? 'Number'} is required';
    }

    if (int.tryParse(value) == null) {
      return 'Invalid ${fieldName ?? 'number'} format';
    }
    return null;
  }

  /// Validates that a value is a valid number format.

  static String? numberValidator(
    String? value, [
    String? fieldName,
  ]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Number'} is required';
    }

    double? data = double.tryParse(value);
    if (data == null) {
      return 'Invalid ${fieldName ?? 'number'} format';
    }

    if (data < 1) {
      return '${fieldName ?? 'number'} must be at least ₹1';
    }

    // Split the number into integer and decimal parts
    final parts = value.split('.');
    if (parts.length > 1 && parts[1].length > 2) {
      return '${fieldName ?? 'Number'} can only have a maximum of 2 decimal places';
    }

    return null;
  }

  /// Validates that a password is at least 8 characters long.
  static String? passwordValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Password'} is required';
    }
    if (value.length < 8) {
      return '${fieldName ?? 'Password'} must be at least 8 characters long';
    }
    return null;
  }

  /// Validates a Strong password.
  static String? strongPasswordValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Password'} is required';
    }
    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigits = value.contains(RegExp(r'\d'));
    final hasSpecialChars = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialChars || value.length < 8) {
      return '${fieldName ?? 'Password'} must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
    }
    return null;
  }

  /// Validates that two values match (typically used for password confirmation).
  static String? confirmPasswordValidator(String? value1, String? value2, [String? fieldName]) {
    if (value1 != value2) {
      return '${fieldName ?? 'Passwords'} do not match';
    }
    return null;
  }

  static String? validateBankAccount(String? val, String fieldName) {
    if (val == null || val.isEmpty) {
      return 'Enter $fieldName Account Number';
    } else if (int.tryParse(val) == null) {
      return 'Enter valid $fieldName Account Number (only digits allowed)';
    } else if (val.length < 9 || val.length > 18) {
      return 'Account Number should be between 9 and 18 digits';
    }

    // Add further validations if needed, like specific formats or checksums

    return null; // null indicates a valid account number
  }

  /// Validates that a value is a valid URL format.
  static String? urlValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'URL'} is required';
    }
    if (!Uri.parse(value).isAbsolute) {
      return 'Invalid ${fieldName ?? 'URL'} format';
    }
    return null;
  }

  /// Validates that a value contains only numeric characters.
  static String? numericValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }
    final isNumeric = double.tryParse(value) != null;
    if (!isNumeric) {
      return '${fieldName ?? 'Field'} must contain only numeric characters';
    }
    return null;
  }

  /// Validates that a value contains only alphabetic characters.
  static String? alphaValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }
    final isAlpha = RegExp(r'^[a-zA-Z]+$').hasMatch(value);
    if (!isAlpha) {
      return 'Invalid ${fieldName ?? 'Field'}';
    }
    return null;
  }

  static String? validateIFSCCode(String? ifscCode) {
    if (ifscCode?.isEmpty == true) {
      return 'Please enter the IFSC code';
    } else if (ifscCode?.length != 11) {
      return 'IFSC code should be 11 characters long';
    } else if (!RegExp(r'^[A-Z]{4}0[0-9]{6}$').hasMatch('$ifscCode')) {
      return 'Invalid IFSC code format';
    }

    return null; // Indicates a valid IFSC code
  }

  static String? alphaNumericValidator(String? value, [String? fieldName]) {
    if (value?.isEmpty == true) {
      return '${fieldName ?? 'Field'} is required';
    }

    if (value != null && value.isNotEmpty) {
      final isAlphaNumeric = RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
      if (!isAlphaNumeric) {
        return 'Invalid ${fieldName ?? 'Field'}';
      }
    }
    return null; // No error if value is empty or null
  }

  static String? alphaSpaceValidator(String? value, [String? fieldName]) {
    if (value?.isEmpty == true) {
      return '${fieldName ?? 'Field'} is required';
    }
    if (value != null && value.isNotEmpty) {
      final isAlphaSpace = RegExp(r'^[a-zA-Z ]+$').hasMatch(value);
      if (!isAlphaSpace) {
        return 'Invalid ${fieldName ?? 'Field'}';
      }
    }
    return null; // No error if value is empty or null
  }

  /// Validates that a value is a valid date format.
  static String? dateValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Date'} is required';
    }
    try {
      DateFormat.yMd().parseStrict(value);
    } catch (_) {
      return 'Invalid ${fieldName ?? 'date'} format';
    }
    return null;
  }
}
