part of 'home_tab_bloc.dart';

@immutable
sealed class HomeTabEvent extends Equatable {}

final class TabChangedEvent extends HomeTabEvent {
  TabChangedEvent({
    required this.homeTab,
  }) : super();

  final HomeTab homeTab;

  @override
  List<Object> get props => [
        homeTab,
      ];
}
