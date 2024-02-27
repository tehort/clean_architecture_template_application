import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/home_module.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => context.read<HomePageContentBloc>().add(
            LoggedUserRequestEvent(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageContentBloc, HomePageContentState>(
        builder: (context, state) {
          switch (state) {
            case HomePageContentLoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomePageContentLoadedState(user: final user):
              return Center(
                child: Text(
                  'Hello ${user.firstName} ${user.lastName}',
                ),
              );
            case HomePageContentErrorState(errorMessage: final errorMessage):
              return Center(
                child: Text(errorMessage),
              );
          }
        },
      ),
    );
  }
}
