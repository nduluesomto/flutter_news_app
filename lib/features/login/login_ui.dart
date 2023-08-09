import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/login/login_bloc/login_bloc.dart';
import 'package:flutter_news_app/features/login/login_widget.dart';

import '../../global_components/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 220),
                Image.asset("lib/assets/icons/app_icon.png",
                    height: 45, width: 42),
                const SizedBox(height: 300),
                loginBtn(
                    AppColors.btnColor, "Войти через ЕЛК", () {}, Colors.white),
                const SizedBox(height: 15),
                loginBtn(AppColors.secondaryBtnColor, 'Войти без авторизации',
                    () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/homepage', (route) => false);
                }, AppColors.btnColor),
              ],
            ),
          ),
        ),
      );
    });
  }
}
