import 'package:bloc/bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_subcat_bloc/home_subcat_events.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_subcat_bloc/home_subcat_states.dart';

class HomeSubCatBloc extends Bloc<HomeSubCatEvent, HomeSubCatState> {
  HomeSubCatBloc() : super(const HomeSubCatState()) {
    on<ChangeIndex>(_changeIndex);
  }

  void _changeIndex(ChangeIndex event, Emitter<HomeSubCatState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
