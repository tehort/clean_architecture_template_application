import 'package:flutter/material.dart';

class Utils {
  static Future<bool> onWillPop(
    _, {
    required String title,
    required String content,
  }) async {
    return (await showDialog(
          context: _,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}

String? validateField(String? formData) {
  if (formData == null || formData.isEmpty) {
    return 'This field cannot be empty';
  }
  if (formData.length > 12) {
    return 'Maximum length is 12 characters';
  }
  return null;
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Email address cannot be empty';
  }

  const pattern = r'\w+@\w+\.';
  final regEx = RegExp(pattern);
  if (!regEx.hasMatch(formEmail)) return 'Invalid Email Address Format.';
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  }

  if (password.length < 6) {
    return 'Password must be atleast 6 characters';
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Password cannot be empty';
  }

  if (confirmPassword.length < 6) {
    return 'Password must be atleast 6 characters';
  }

  if (password != confirmPassword) {
    return 'Passwords do not match';
  }

  return null;
}

String? validateCheckbox(bool? checkboxValue) {
  if (checkboxValue != true) {
    return 'You need to accept the terms';
  }

  return null;
}
