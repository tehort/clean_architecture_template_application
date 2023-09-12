import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:presentation/src/widgets/progress_hud.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
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
                      const _LoginButton(),
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
        context.read<SignInBloc>().add(UsernameChanged(username: username));
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
        context.read<SignInBloc>().add(PasswordChanged(password: password));
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<SignInBloc>().add(SignInButtonPressed());
      },
      child: const Text('Login'),
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
    return const TextButton(
      onPressed: null,
      child: Text(
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
