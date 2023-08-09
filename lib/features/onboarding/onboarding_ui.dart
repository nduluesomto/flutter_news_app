import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/global_components/app_colors.dart';

import 'onboard_widgets.dart';
import 'onboarding_bloc/onboard_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<BoardingBloc, OnBoardState>(
      builder: (BuildContext context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                state.page = index;
                BlocProvider.of<BoardingBloc>(context).add(OnBoardEvent());
              },
              children: [
                OnBoardPageView(
                    index: 1,
                    context: context,
                    skipBtnName: 'Пропустить',
                    pageController: controller,
                    title: 'Уникальные сервисы',
                    subTitle:
                        'Воспользуйтесь удобством специальных сервисов для участников мероприятий',
                    mainBtnName: 'Далее',
                    imgPath: 'lib/assets/images/slide_one.jpg'),
                OnBoardPageView(
                  index: 2,
                  context: context,
                  skipBtnName: 'Пропустить',
                  pageController: controller,
                  title: 'Центр Уведомлений',
                  subTitle:
                      'Сразу после наступления события, мы уведомим вас сообщением на мобильном устройстве',
                  mainBtnName: 'Далее',
                  imgPath: 'lib/assets/images/slide_two.jpg',
                ),
                OnBoardPageView(
                    index: 3,
                    context: context,
                    skipBtnName: '',
                    pageController: controller,
                    title: 'Программа мероприятий',
                    subTitle:
                        'Всегда под рукой актуальная информацая о программе мероприятия',
                    mainBtnName: 'Начать работу',
                    imgPath: 'lib/assets/images/slide_three.jpg'),
              ],
            ),
            Positioned(
                bottom: 65,
                child: DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeColor: AppColors.btnColor,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ))
          ],
        );
      },
    ));
  }
}
