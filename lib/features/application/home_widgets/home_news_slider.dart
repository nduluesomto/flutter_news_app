import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_slider_bloc/home_slider_bloc.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_subcat_bloc/home_subcat_states.dart';
import 'package:flutter_news_app/features/application/application_blocs/home_tab_bloc/home_tab_bloc.dart';
import 'package:flutter_news_app/features/models/category_model.dart';
import 'package:flutter_news_app/features/models/news_model.dart';
import 'package:flutter_news_app/global_components/app_colors.dart';

import '../application_blocs/home_subcat_bloc/home_subcat_bloc.dart';
import '../application_blocs/home_subcat_bloc/home_subcat_events.dart';
import 'home_first_page_widget.dart';
import 'news_details_widget.dart';

Widget homeScreen({required BuildContext context}) {
  return BlocProvider.of<HomeTabBloc>(context).state.tabStatus == true
      ? homeSlider()
      : homeNewsSection();
}

Widget homeSlider() {
  return BlocProvider<HomeSliderBloc>(
    create: (context) => HomeSliderBloc(),
    child: SizedBox(
      height: 500,
      child: mainPageSlider(),
    ),
  );
}

Widget homeNewsSection() {
  return Column(
    children: [
      BlocProvider(
          create: (context) => HomeSubCatBloc(), child: categoryList()),
      const SizedBox(height: 10),
      newsList(),
    ],
  );
}

Widget newsList() {
  return SizedBox(
    height: 480,
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: NewsModel.newsModel.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(14))),
                  context: context,
                  builder: (context) => buildSheet(
                      context: context,
                      imgPath: NewsModel.newsModel[index].imgPath,
                      newsTitle: NewsModel.newsModel[index].title,
                      publishedDate: NewsModel.newsModel[index].publishedDate,
                      publishedTime: NewsModel.newsModel[index].publishedTime,
                      newsDetails: NewsModel.newsModel[index].newsPost));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              height: 150,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Text(
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        NewsModel.newsModel[index].title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 45),
                      Row(
                        children: [
                          Text(NewsModel.newsModel[index].publishedDate,
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13)),
                          const SizedBox(width: 5),
                          const Text('.'),
                          const SizedBox(width: 5),
                          Text(NewsModel.newsModel[index].publishedTime,
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13)),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 110,
                    width: 95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                NewsModel.newsModel[index].imgPath))),
                  )
                ],
              ),
            ),
          );
        }),
  );
}

Widget categoryList() {
  return BlocBuilder<HomeSubCatBloc, HomeSubCatState>(
    builder: (BuildContext context, state) {
      return SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<HomeSubCatBloc>(context)
                      .add(ChangeIndex(index));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  decoration:
                      BlocProvider.of<HomeSubCatBloc>(context).state.index ==
                              index
                          ? BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(12))
                          : BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    category[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: BlocProvider.of<HomeSubCatBloc>(context)
                                    .state
                                    .index ==
                                index
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              );
            }),
      );
    },
  );
}
