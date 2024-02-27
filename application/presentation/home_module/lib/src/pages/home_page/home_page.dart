import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/home_module.dart';
import 'package:home_module/src/pages/home_page/home_page_drawer.dart';
import 'package:service_locator/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.get<HomeTabBloc>(),
      child: Scaffold(
        drawer: const HomePageDrawer(),
        appBar: AppBar(
          title: BlocBuilder<HomeTabBloc, HomeTabState>(
            builder: (context, state) {
              return Text(state.selectedTab.value);
            },
          ),
        ),
        body: BlocBuilder<HomeTabBloc, HomeTabState>(
          builder: (context, state) {
            switch (state.selectedTab) {
              case HomeTab.homePage:
                return const HomePageContentProvider();
              case HomeTab.tokenInformationPage:
                return const TokenInformationPage();
            }
          },
        ),
      ),
    );
  }
}
