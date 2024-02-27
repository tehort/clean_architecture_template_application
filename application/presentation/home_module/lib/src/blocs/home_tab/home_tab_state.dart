part of 'home_tab_bloc.dart';

enum HomeTab {
  homePage,
  tokenInformationPage,
}

extension HomeTabValue on HomeTab {
  String get value {
    switch (this) {
      case HomeTab.homePage:
        return 'Home';
      case HomeTab.tokenInformationPage:
        return 'Token information';
    }
  }
}

class HomeTabState extends Equatable {
  const HomeTabState({
    required this.selectedTab,
  });

  const HomeTabState.initial() : selectedTab = HomeTab.homePage;

  final HomeTab selectedTab;

  @override
  List<Object> get props => [
        selectedTab,
      ];
}
