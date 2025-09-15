abstract class AppValidator {
  static String? emailvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  static String? namevalidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters";
    }

    return null;
  }

  static String? phonevalidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number cannot be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters";
    }

    if (!RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(value)) {
      return "Enter a valid phone number";
    }

    return null;
  }
}
