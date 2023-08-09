import 'package:bloc/bloc.dart';

part 'home_events.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeNavigatorEvent>(_homeNavigateEvent);
  }

  void _homeNavigateEvent(HomeNavigatorEvent event, Emitter<HomeState> emit) {
    emit(HomeState(index: event.index));
  }
}
