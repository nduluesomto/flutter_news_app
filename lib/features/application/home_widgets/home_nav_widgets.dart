import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/application/pages/chat.dart';
import 'package:flutter_news_app/features/application/pages/profile.dart';

import '../pages/events.dart';
import '../pages/home.dart';

Widget buildHomePages(int index) {
  List<Widget> navWidgets = [
    const Home(),
    const EventPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  return navWidgets[index];
}

var homeButtonNav = [
  BottomNavigationBarItem(
      icon: Image.asset('lib/assets/icons/home.png', height: 20),
      label: 'главная'),
  BottomNavigationBarItem(
      icon: Image.asset('lib/assets/icons/event.png', height: 20),
      label: 'мероприятия'),
  BottomNavigationBarItem(
      icon: Image.asset('lib/assets/icons/chat.png', height: 20), label: 'чат'),
  BottomNavigationBarItem(
      icon: Image.asset('lib/assets/icons/profile.png', height: 20),
      label: 'мой профиль'),
];
