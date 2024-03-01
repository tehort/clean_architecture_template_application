import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_ui/purple_ui.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Align(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 500,
                      ),
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
                          _AcceptTermsCheckBox(),
                          _SignUpButton(formKey: _formKey),
                          const _ValidateEmailButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (state is SignUpLoadingState) const ProgressHud(),
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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sign up on App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Text(
            'Create a free account on App and get started',
            // style: Theme.of(context).textTheme.bodyLarge,
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('sign_up_form_title_textField'),
        decoration: InputDecoration(
          labelText: 'Title',
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
        keyboardType: TextInputType.text,
        validator: validateField,
        onChanged: (title) {
          context.read<SignUpBloc>().add(SignUpTitleChangedEvent(title: title));
        },
      ),
    );
  }
}

class _FirstNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('sign_up_form_first_name_textField'),
        decoration: InputDecoration(
          labelText: 'First Name',
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
        validator: validateField,
        keyboardType: TextInputType.text,
        onChanged: (firstName) {
          context.read<SignUpBloc>().add(SignUpFirstNameChangedEvent(firstName: firstName));
        },
      ),
    );
  }
}

class _LastNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('sign_up_form_last_name_textField'),
        decoration: InputDecoration(
          labelText: 'Last Name',
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
        keyboardType: TextInputType.text,
        validator: validateField,
        onChanged: (lastName) {
          context.read<SignUpBloc>().add(SignUpLastNameChangedEvent(lastName: lastName));
        },
      ),
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('sign_up_form_email_textField'),
        decoration: InputDecoration(
          labelText: 'E-mail',
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
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onChanged: (email) {
          context.read<SignUpBloc>().add(SignUpEmailChangedEvent(email: email));
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
        key: const Key('sign_up_form_password_textField'),
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
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: validatePassword,
        onChanged: (password) {
          context.read<SignUpBloc>().add(SignUpPasswordChangedEvent(password: password));
        },
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        key: const Key('sign_up_form_confirm_password_textField'),
        decoration: InputDecoration(
          labelText: 'Confirm Password',
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
        keyboardType: TextInputType.text,
        onChanged: (confirmPassword) {
          context.read<SignUpBloc>().add(SignUpConfirmPasswordChangedEvent(confirmPassword: confirmPassword));
        },
      ),
    );
  }
}

class _AcceptTermsCheckBox extends StatefulWidget {
  @override
  State<_AcceptTermsCheckBox> createState() => _AcceptTermsCheckBoxState();
}

class _AcceptTermsCheckBoxState extends State<_AcceptTermsCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckBoxFormFieldWidget(
      isChecked: context.read<SignUpBloc>().state.acceptTerms,
      label: const Text('I accept the terms'),
      validator: validateCheckbox,
      onChanged: (bool? value) {
        context.read<SignUpBloc>().add(SignUpAcceptTermsChangedEvent(acceptTerms: value ?? false));
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    required formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        key: const Key('sign_up_form_sign_up_button'),
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<SignUpBloc>().add(SignUpButtonPressedEvent());
          }
        },
        child: const Text('SIGN UP'),
      ),
    );
  }
}

class _ValidateEmailButton extends StatelessWidget {
  const _ValidateEmailButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const VerifyEmailDialog(),
        );
      },
      child: const Text('Validate here your email'),
    );
  }
}
