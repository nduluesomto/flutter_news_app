import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_blocs/home_bottom_navigation_bloc/home_bloc.dart';
import 'home_widgets/home_nav_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 5, right: 10, top: 5),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            currentIndex: state.index,
            onTap: (value) {
              setState(() {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeNavigatorEvent(index: value));
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: homeButtonNav,
          ),
        ),
        body: buildHomePages(state.index),
      );
    });
  }
}
