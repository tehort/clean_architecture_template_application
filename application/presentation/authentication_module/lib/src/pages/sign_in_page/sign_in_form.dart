import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_ui/purple_ui.dart';

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const _TitleSection(),
                    _Section(
                      children: [
                        _UsernameInputField(),
                        _PasswordInputField(),
                        const _SignInButton(),
                        const _ForgotPasswordButton(),
                      ],
                    ),
                    const _SignUpSection(),
                  ],
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

class _Section extends StatelessWidget {
  const _Section({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'The Clean App',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class _UsernameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('loginForm_usernameInput_textField'),
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        onChanged: (username) {
          context.read<SignInBloc>().add(SignInUsernameChangedEvent(username: username));
        },
      ),
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('loginForm_passwordInput_textField'),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (password) {
          context.read<SignInBloc>().add(SignInPasswordChangedEvent(password: password));
        },
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(15),
          visualDensity: VisualDensity.comfortable,
          side: BorderSide(color: Colors.white.withOpacity(0.75)),
        ),
        onPressed: () {
          context.read<SignInBloc>().add(SignInSignInButtonPressedEvent());
        },
        child: const Text('SIGN IN'),
      ),
    );
  }
}

class _SignUpSection extends StatelessWidget {
  const _SignUpSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, PagesNameConstants.signUpPage),
          child: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
