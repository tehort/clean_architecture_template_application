import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/app/dependency_injection.dart';
import 'package:presentation/src/authentication/verify_email_dialog/bloc/bloc/verify_email_dialog_bloc.dart';
import 'package:presentation/src/utils/utils.dart';
import 'package:presentation/src/widgets/progress_hud.dart';

class VerifyEmailDialog extends StatefulWidget {
  const VerifyEmailDialog({
    super.key,
  });

  @override
  State<VerifyEmailDialog> createState() => _VerifyEmailDialogState();
}

class _VerifyEmailDialogState extends State<VerifyEmailDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerifyEmailDialogBloc>(),
      child: BlocConsumer<VerifyEmailDialogBloc, VerifyEmailDialogState>(
        listener: (context, state) {
          if (state is VerifyEmailDialogErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is VerifyEmailDialogSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Email validated successfully'),
              ),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Validate your email'),
            content: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Token',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            enabled: true,
                            validator: validateToken,
                            onChanged: (value) {
                              context.read<VerifyEmailDialogBloc>().add(
                                    VerifyEmailDialogTokenChangedEvent(token: value),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is VerifyEmailDialogLoadingState) const ProgressHud(),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Validate'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<VerifyEmailDialogBloc>().add(
                          VerifyEmailDialogButtonPressedEvent(),
                        );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
