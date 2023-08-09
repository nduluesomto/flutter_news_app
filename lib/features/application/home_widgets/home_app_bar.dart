import 'package:flutter/material.dart';
import 'package:flutter_news_app/global_components/app_colors.dart';

Widget homeHeader() {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('lib/assets/icons/app_icon.png', height: 50, width: 60),
        Row(
          children: [
            containerOne(),
            const SizedBox(width: 6),
            notification(),
          ],
        )
      ],
    ),
  );
}

Widget containerOne() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'О фонде',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    ),
  );
}

Widget notification() {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset('lib/assets/icons/notification.png', width: 20),
      ),
      Positioned(
          top: -7,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: AppColors.btnColor, shape: BoxShape.circle),
            child: const Text('1',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ))
    ],
  );
}
