import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_up/widgets/sign_up_form.dart';
import 'package:service_locator/service_locator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ServiceLocator.get<SignUpBloc>(),
        child: const SignUpForm(),
      ),
    );
  }
}
