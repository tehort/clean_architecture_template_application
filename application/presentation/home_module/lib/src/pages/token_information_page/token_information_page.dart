import 'package:authentication_module/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TokenInformationPage extends StatelessWidget {
  const TokenInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: context.read<AuthenticationBloc>(),
        child: BlocSelector<AuthenticationBloc, AuthenticationState, Authenticated>(
          selector: (state) => state as Authenticated,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Created: ${state.authenticationInfo.created}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Updated: ${state.authenticationInfo.updated ?? 'N/A'}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Role: ${state.authenticationInfo.role}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('JWT Token: ${state.authenticationInfo.jwtToken}'),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Revoke Token'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Refresh Token'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Test Token'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
