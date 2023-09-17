import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:presentation/src/widgets/progress_hud.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        // if (state is SignUpErrorState) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(state.errorMessage),
        //     ),
        //   );
        // }
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
                      const _SignUpInformation(),
                      _TitleInputField(),
                      _FirstNameInputField(),
                      _LastNameInputField(),
                      _EmailInputField(),
                      _PasswordInputField(),
                      _ConfirmPasswordInput(),
                      const _SignUpButton(),
                    ],
                  ),
                ),
              ),
            ),
            // if (state is SignUpLoadingState) const ProgressHud(),
          ],
        );
      },
    );
  }
}

class _SignUpInformation extends StatelessWidget {
  const _SignUpInformation();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Sign up on App', style: Theme.of(context).textTheme.headline6),
          Text('Create a free account on App and get started', style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}

class _TitleInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_title_textField'),
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
      keyboardType: TextInputType.text,
      onChanged: (title) {
        context.read<SignUpBloc>().add(TitleChanged(title: title));
      },
    );
  }
}

class _FirstNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_first_name_textField'),
      decoration: const InputDecoration(
        labelText: 'First Name',
      ),
      keyboardType: TextInputType.text,
      onChanged: (firstName) {
        context.read<SignUpBloc>().add(FirstNameChanged(firstName: firstName));
      },
    );
  }
}

class _LastNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_last_name_textField'),
      decoration: const InputDecoration(
        labelText: 'Last Name',
      ),
      keyboardType: TextInputType.text,
      onChanged: (lastName) {
        context.read<SignUpBloc>().add(LastNameChanged(lastName: lastName));
      },
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_email_textField'),
      decoration: const InputDecoration(
        labelText: 'E-mail',
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) {
        context.read<SignUpBloc>().add(EmailChanged(email: email));
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_password_textField'),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      keyboardType: TextInputType.text,
      onChanged: (password) {
        context.read<SignUpBloc>().add(PasswordChanged(password: password));
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('sign_up_form_confirm_password_textField'),
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
      ),
      keyboardType: TextInputType.text,
      onChanged: (confirmPassword) {
        context.read<SignUpBloc>().add(ConfirmPasswordChanged(confirmPassword: confirmPassword));
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('sign_up_form_sign_up_button'),
      style: ElevatedButton.styleFrom(),
      // onPressed: context.read<SignUpBloc>().signUp,
      onPressed: null,
      child: const Text('SIGN UP'),
    );
  }
}
