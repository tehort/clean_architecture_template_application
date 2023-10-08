import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/home/bloc/home_tab_bloc.dart';
import 'package:home/src/presentation/home/widgets/home_page_drawer.dart';
import 'package:home/src/presentation/home_content/home_page_content.dart';
import 'package:home/src/presentation/token_information/widgets/token_information_page.dart';
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
