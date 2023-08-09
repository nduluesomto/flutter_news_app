import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_bottom_navigation_bloc/home_bloc.dart';

import '../../home_widgets/home_nav_widgets.dart';
import 'my_activities_widgets.dart';

class MyActivitiesWidget extends StatefulWidget {
  const MyActivitiesWidget({Key? key}) : super(key: key);

  @override
  State<MyActivitiesWidget> createState() => _MyActivitiesWidgetState();
}

class _MyActivitiesWidgetState extends State<MyActivitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        body: myActivities(context: context),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 5, right: 10, top: 5),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            currentIndex: state.index,
            onTap: (value) {
              setState(() {
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => buildHomePages(state.index)));
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeNavigatorEvent(index: value));
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: homeButtonNav,
          ),
        ),
      );
    });
  }
}
