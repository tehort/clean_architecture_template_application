import 'package:authentication/src/presentation/authentication/verify_email/bloc/bloc/verify_email_bloc.dart';
import 'package:authentication/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_ui/purple_ui.dart';
import 'package:service_locator/service_locator.dart';

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
      create: (context) => ServiceLocator.get<VerifyEmailBloc>(),
      child: BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is VerifyEmailSuccessState) {
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
                              context.read<VerifyEmailBloc>().add(
                                    VerifyEmailTokenChangedEvent(token: value),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is VerifyEmailLoadingState) const ProgressHud(),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Validate'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<VerifyEmailBloc>().add(
                          VerifyEmailButtonPressedEvent(),
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
