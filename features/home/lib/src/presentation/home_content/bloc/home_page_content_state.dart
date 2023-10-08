part of 'home_page_content_bloc.dart';

sealed class HomePageContentState extends Equatable {}

class HomePageContentLoadedState extends HomePageContentState {
  HomePageContentLoadedState({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [
        user,
      ];
}

class HomePageContentLoadingState extends HomePageContentState {
  HomePageContentLoadingState() : super();

  @override
  List<Object?> get props => [];
}

class HomePageContentErrorState extends HomePageContentState {
  HomePageContentErrorState({
    required this.errorMessage,
  }) : super();

  final String errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
