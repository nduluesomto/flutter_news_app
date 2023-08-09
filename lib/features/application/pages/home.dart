import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_tab_bloc/home_tab_bloc.dart';

import '../home_widgets/home_app_bar.dart';
import '../home_widgets/home_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          homeHeader(),
          const SizedBox(height: 20),
          BlocProvider(
              create: (context) => HomeTabBloc(),
              child: tabBar(context: context))
        ],
      ),
    );
  }
}
