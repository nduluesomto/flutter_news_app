import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_tab_bloc/home_tab_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_tab_bloc/home_tab_states.dart';

import '../application_blocs/home_tab_bloc/home_tab_events.dart';
import 'home_news_slider.dart';

Widget tabBar({required BuildContext context}) {
  return BlocBuilder<HomeTabBloc, HomeTabState>(
      builder: (BuildContext context, state) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.12,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _tab1(context: context),
                _tab2(context: context),
              ],
            )),
        const SizedBox(height: 20),
        homeScreen(context: context),
      ],
    );
  });
}

Widget _tab1({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      BlocProvider.of<HomeTabBloc>(context).add(const ChangeTab());
    },
    child: Container(
      height: 38,
      margin: const EdgeInsets.only(left: 3),
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BlocProvider.of<HomeTabBloc>(context).state.tabStatus
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 2))
                ])
          : const BoxDecoration(),
      child: const Center(
        child: Text(
          'Мероприятие',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}

Widget _tab2({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      BlocProvider.of<HomeTabBloc>(context).add(const ChangeTab());
    },
    child: Container(
      margin: const EdgeInsets.only(right: 3),
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 55),
      decoration: BlocProvider.of<HomeTabBloc>(context).state.tabStatus == true
          ? const BoxDecoration()
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 2))
                ]),
      child: const Center(
        child: Text(
          'Новости',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
