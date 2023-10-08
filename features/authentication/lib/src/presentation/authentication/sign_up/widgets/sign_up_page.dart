import 'package:authentication/src/presentation/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:authentication/src/presentation/authentication/sign_up/widgets/sign_up_form.dart';
import 'package:authentication/src/presentation/authentication/verify_email/widgets/verify_email_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_locator/service_locator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.get<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            } else if (state is SignUpShowSnackbarState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
              // Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => const VerifyEmailDialog(),
              );
            }
          },
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
