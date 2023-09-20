import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/presentation/authentication/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/utils/pages_names_constants.dart';
import 'package:presentation/src/widgets/progress_hud.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Align(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(38, 0, 38, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _AppText(),
                      _UsernameInputField(),
                      _PasswordInputField(),
                      const _SignInButton(),
                      const _ForgotPasswordButton(),
                      const _SignUpText(),
                      const _SignUpButton(),
                    ],
                  ),
                ),
              ),
            ),
            if (state is SignInLoadingState) const ProgressHud(),
          ],
        );
      },
    );
  }
}

class _AppText extends StatelessWidget {
  const _AppText();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30, top: 30),
      child: Text(
        'My App',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _UsernameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginForm_usernameInput_textField'),
      decoration: const InputDecoration(labelText: 'Username'),
      onChanged: (username) {
        context.read<SignInBloc>().add(SignInUsernameChangedEvent(username: username));
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginForm_passwordInput_textField'),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      keyboardType: TextInputType.text,
      onChanged: (password) {
        context.read<SignInBloc>().add(SignInPasswordChangedEvent(password: password));
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<SignInBloc>().add(SignInSignInButtonPressedEvent());
      },
      child: const Text('Sign in'),
    );
  }
}

class _SignUpText extends StatelessWidget {
  const _SignUpText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Don't have an account yet?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, PagesNamesConstants.signUpPage),
      child: const Text(
        'Sign up',
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return const TextButton(
      onPressed: null,
      child: Text(
        'Forgot Password?',
      ),
    );
  }
}
