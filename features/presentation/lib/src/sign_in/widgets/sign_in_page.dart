import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/app/dependency_injection.dart';
import 'package:presentation/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/sign_in/widgets/sign_in_form.dart';
import 'package:presentation/src/utils/utils.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Utils.onWillPop(
          context,
          title: 'Are you sure?',
          content: 'Do you want to exit the app?',
        ),
        child: BlocProvider(
          create: (context) => sl<SignInBloc>(),
          child: SignInForm(),
        ),
      ),
    );
  }
}
