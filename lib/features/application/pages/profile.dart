import 'package:flutter/material.dart';

import '../home_widgets/profile_id_widget.dart';
import '../home_widgets/profile_list_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('мой профиль',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              const SizedBox(height: 40),
              profileWidget(),
              const SizedBox(height: 35),
              Text('Основное',
                  style: TextStyle(color: Colors.black.withOpacity(0.7))),
              const SizedBox(height: 10),
              profileList(context: context)
            ],
          ),
        ),
      ),
    );
  }
}
