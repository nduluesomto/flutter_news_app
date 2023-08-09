import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/onboarding/onboarding_bloc/onboard_bloc.dart';

import '../features/application/application_blocs/home_bottom_navigation_bloc/home_bloc.dart';
import '../features/application/application_blocs/home_tab_bloc/home_tab_bloc.dart';
import '../features/login/login_bloc/login_bloc.dart';

class AppBlocProviders {
  static get allAppBlocProviders => [
        BlocProvider(create: (context) => BoardingBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => HomeTabBloc()),
      ];
}
