import 'package:flutter/material.dart';

import '../../../global_components/app_colors.dart';

Widget profileWidget() {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 5),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            profilePic(),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Дике-Ндулуе Джонпол',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 13),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "ID: 1241",
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500),
                  )),
            ]),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey))
      ],
    ),
  );
}

Widget profilePic() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(60),
    child: Image.asset(
        width: 80, height: 80, 'lib/assets/images/profile_picture.jpg'),
  );
}
