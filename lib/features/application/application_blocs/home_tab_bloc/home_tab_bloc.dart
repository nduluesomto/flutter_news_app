import 'package:bloc/bloc.dart';

import '../../home_widgets/home_news_slider.dart';
import 'home_tab_events.dart';
import 'home_tab_states.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(const HomeTabState()) {
    on<ChangeTab>(changeTab);
  }

  void changeTab(ChangeTab event, Emitter<HomeTabState> emit) {
    emit(state.changeTab());
    if (state.tabStatus == true) {
      homeSlider();
    } else {
      homeNewsSection();
    }
  }
}
