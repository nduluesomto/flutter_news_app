import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/onboarding/onboarding_bloc/onboard_bloc.dart';

import '../features/application/application_blocs/home_bottom_navigation_bloc/home_bloc.dart';
import '../features/application/homepage.dart';
import '../features/login/login_bloc/login_bloc.dart';
import '../features/login/login_ui.dart';
import '../features/onboarding/onboarding_ui.dart';

class AppRoutes {
  static const initialPage = '/';
  static const loginPage = '/login';
  static const homePage = '/homepage';
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.initialPage,
          page: const OnBoardingScreen(),
          bloc: BlocProvider(create: (_) => BoardingBloc())),
      PageEntity(
          route: AppRoutes.loginPage,
          page: const LoginPage(),
          bloc: BlocProvider(create: (_) => LoginBloc())),
      PageEntity(
          route: AppRoutes.homePage,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomeBloc(),
          ))
    ];
  }

  //all BlocProviders
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //model for Navigator click button
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      //checking if the route name matches when navigator.of(context) is triggered
      var result =
          routes().where((element) => element.route == routeSettings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: routeSettings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: routeSettings);
  }
}
