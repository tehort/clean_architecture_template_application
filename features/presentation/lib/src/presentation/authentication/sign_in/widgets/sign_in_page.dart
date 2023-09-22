import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/widgets/sign_in_form.dart';
import 'package:presentation/src/utils/utils.dart';
import 'package:service_locator/service_locator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.get<SignInBloc>(),
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () => Utils.onWillPop(
            context,
            title: 'Are you sure?',
            content: 'Do you want to exit the app?',
          ),
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            child: const SignInForm(),
          ),
        ),
      ),
    );
  }
}
