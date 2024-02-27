import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/home_module.dart';
import 'package:home_module/src/pages/home_content/home_page_content_provider.dart';
import 'package:service_locator/service_locator.dart';

class HomePageContentProvider extends StatelessWidget {
  const HomePageContentProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.get<HomePageContentBloc>(),
      child: const HomePageContent(),
    );
  }
}
