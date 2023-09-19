import 'package:flutter/material.dart';
import 'package:presentation/src/utils/utils.dart';

class SignUpEmailValidationDialog extends StatefulWidget {
  const SignUpEmailValidationDialog({
    super.key,
    String? email,
  }) : _email = email;

  final String? _email;

  @override
  State<SignUpEmailValidationDialog> createState() => _SignUpEmailValidationDialogState();
}

class _SignUpEmailValidationDialogState extends State<SignUpEmailValidationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Validate your email:'),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: false,
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Token',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: true,
                  validator: validateEmail,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Validate'),
          onPressed: () {},
        ),
      ],
    );
  }
}
