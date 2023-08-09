import 'package:bloc/bloc.dart';

part 'onboard_events.dart';
part 'onboard_states.dart';

class BoardingBloc extends Bloc<OnBoardEvent, OnBoardState> {
  BoardingBloc() : super(OnBoardState()) {
    on<OnBoardEvent>(_onBoardEvent);
  }

  _onBoardEvent(OnBoardEvent event, Emitter<OnBoardState> emit) {
    emit(OnBoardState(page: state.page));
  }
}
