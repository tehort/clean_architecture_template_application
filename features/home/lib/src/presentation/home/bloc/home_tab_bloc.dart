import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_tab_event.dart';
part 'home_tab_state.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(const HomeTabState.initial()) {
    on<TabChangedEvent>(_onTabChangedEvent);
  }

  Future<void> _onTabChangedEvent(
    TabChangedEvent event,
    Emitter<HomeTabState> emit,
  ) async {
    emit(HomeTabState(selectedTab: event.homeTab));
  }
}
