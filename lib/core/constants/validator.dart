import 'package:easy_localization/easy_localization.dart';

class MyValidators {
    static String? displayNameValidator(String? displayName) {
      if (displayName == null || displayName.isEmpty) {
        return "displayNameEmpty".tr();
      }
      if (displayName.length < 3 || displayName.length > 20) {
        return "displayNameLength".tr();
      }
      return null;
    }
  
    static String? emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter an E-mail Address";
      }
      if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
          .hasMatch(value)) {
        return "Please enter a valid E-mail";
      }
      return null;
    }
  
    static String? passwordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return "enterPassword".tr();
      }
      if (value.length < 6) {
        return "passwordLength".tr();
      }
      return null;
    }
  
    // ignore: non_constant_identifier_names
    static String? repeatPasswordValidator({String? value, String? Password}) {
      if (value != Password) {
        return "passwordMismatch".tr();
      }
      return null;
    }
  
    static String? phoneNumberValidator(String? phoneNumber) {
      if (phoneNumber == null || phoneNumber.isEmpty) {
        return "phoneNumberEmpty".tr();
      }
      if (phoneNumber.isEmpty || phoneNumber.length < 10) {
        return "phoneNumberLength".tr();
      }
      return null;
    }
  
    static String? locationValidator(String? location) {
      if (location == null || location.isEmpty) {
        return "locationEmpty";
      }
      return null;
    }

  static String? validateEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return "$text is required and cannot be empty!";
    }
    return null;
  }
}
