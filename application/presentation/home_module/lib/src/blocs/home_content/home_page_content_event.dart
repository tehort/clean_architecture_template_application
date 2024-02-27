part of 'home_page_content_bloc.dart';

sealed class HomePageContentEvent extends Equatable {}

class LoggedUserRequestEvent extends HomePageContentEvent {
  LoggedUserRequestEvent() : super();

  @override
  List<Object?> get props => [];
}
