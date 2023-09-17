import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/app/dependency_injection.dart';
import 'package:presentation/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:presentation/src/sign_up/widgets/sign_up_form.dart';
import 'package:presentation/src/utils/utils.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Utils.onWillPop(
          context,
          title: 'Are you sure?',
          content: 'Do you want to exit registration?',
        ),
        child: BlocProvider(
          create: (context) => sl<SignUpBloc>(),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
