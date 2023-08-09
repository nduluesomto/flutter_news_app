import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_slider_bloc/home_slider_state.dart';
import 'package:flutter_news_app/features/models/news_model.dart';

import '../application_blocs/home_slider_bloc/home_slider_bloc.dart';
import '../application_blocs/home_slider_bloc/home_slider_event.dart';

Widget mainPageSlider() {
  return BlocBuilder<HomeSliderBloc, SliderState>(
      builder: (BuildContext context, state) {
    return Stack(children: [
      SizedBox(
          height: 460,
          child: PageView.builder(
              onPageChanged: (index) {
                state.index = index;
                BlocProvider.of<HomeSliderBloc>(context)
                    .add(const HomeIdEvent());
              },
              controller: PageController(viewportFraction: 0.9),
              scrollDirection: Axis.horizontal,
              itemCount: NewsModel.newsModel.length,
              itemBuilder: (BuildContext context, index) {
                return sliderBuild(
                    imagePath: NewsModel.newsModel[index].imgPath,
                    publishedDate: NewsModel.newsModel[index].publishedDate,
                    newsTitle: NewsModel.newsModel[index].title,
                    location: NewsModel.newsModel[index].location);
              })),
      paginationIndicator(state: state),
    ]);
  });
}

Widget sliderBuild(
    {required String imagePath,
    required String publishedDate,
    required String newsTitle,
    required String location}) {
  return Container(
    height: 400,
    margin: const EdgeInsets.only(left: 5, right: 10),
    padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image:
            DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 30),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                  height: 24, width: 24, 'lib/assets/icons/forward.png'),
            )
          ],
        ),
        const SizedBox(height: 220),
        Text(publishedDate,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Text(newsTitle,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19)),
        const SizedBox(height: 20),
        Text(location,
            style: TextStyle(
                color: Colors.grey.shade100, fontWeight: FontWeight.w600))
      ],
    ),
  );
}

Widget paginationIndicator({required SliderState state}) {
  return Positioned(
      bottom: 0,
      left: 150,
      child: DotsIndicator(
        position: state.index,
        dotsCount: NewsModel.newsModel.length,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            color: Colors.grey,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: Colors.black,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      ));
}
