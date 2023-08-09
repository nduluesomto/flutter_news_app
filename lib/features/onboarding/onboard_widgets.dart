import 'package:flutter/material.dart';
import 'package:flutter_news_app/global_components/app_colors.dart';

class OnBoardPageView extends StatelessWidget {
  final int index;
  final BuildContext context;
  void Function()? skipBtn;
  final String skipBtnName;
  final PageController pageController;
  final String title;
  final String subTitle;
  final String mainBtnName;
  final String imgPath;
  OnBoardPageView(
      {Key? key,
      required this.index,
      required this.context,
      required this.skipBtnName,
      required this.pageController,
      required this.title,
      required this.subTitle,
      required this.mainBtnName,
      required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imgPath)),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.1),
          ], begin: Alignment.bottomLeft, end: Alignment.center),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 25,
                top: 70,
                child: _skipButton(
                    skipBtnName: skipBtnName,
                    index: index,
                    pageController: pageController)),
            Positioned(
              bottom: 65,
              left: 0,
              child: Container(
                height: 220,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: _mainTextReusable(title)),
                    const SizedBox(height: 20),
                    Center(child: _subTextReusable(subTitle)),
                    const SizedBox(height: 20),
                    _mainBtn(
                        btnName: mainBtnName,
                        index: index,
                        context: context,
                        pageController: pageController),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _mainTextReusable(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 25),
  );
}

Widget _subTextReusable(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 16));
}

_skipButton(
    {required String skipBtnName,
    required int index,
    required PageController pageController}) {
  if (index > 2) {
    return const SizedBox();
  } else {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(3,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate);
      },
      child: Container(
        //margin: const EdgeInsets.only(right: 20, top: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          skipBtnName,
          style: const TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

Widget _mainBtn(
    {required String btnName,
    required int index,
    required BuildContext context,
    required PageController pageController}) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 700),
            curve: Curves.decelerate);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: AppColors.btnColor, borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        btnName,
        style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 17),
      )),
    ),
  );
}
