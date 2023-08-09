import 'package:bloc/bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_slider_bloc/home_slider_event.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_slider_bloc/home_slider_state.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, SliderState> {
  HomeSliderBloc() : super(SliderState()) {
    on<HomeIdEvent>(_homeIdEvent);
  }

  void _homeIdEvent(HomeIdEvent event, Emitter<SliderState> emit) {
    emit(SliderState(index: state.index));
  }
}
