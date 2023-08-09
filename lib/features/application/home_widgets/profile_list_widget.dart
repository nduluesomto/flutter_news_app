import 'package:flutter/material.dart';
import 'package:flutter_news_app/global_components/app_colors.dart';

import '../pages/sub_pages/my_activities.dart';

Widget profileList({required BuildContext context}) {
  return SizedBox(
    height: 400,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        list(
            text: "Центр уведомлений",
            iconPath: 'lib/assets/icons/notification.png'),
        list(
            text: "Мои мероприятия",
            iconPath: 'lib/assets/icons/event.png',
            func: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyActivitiesWidget()));
            }),
        list(text: "Сервисы", iconPath: 'lib/assets/icons/notification.png'),
        list(
            text: "Статус бейдж и ТС", iconPath: 'lib/assets/icons/status.png'),
        list(
            text: "Настройки аккаунта",
            iconPath: 'lib/assets/icons/settings.png'),
        const SizedBox(height: 20),
        _logoutButton(),
      ],
    ),
  );
}

Widget list(
    {required String text, required String iconPath, void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade400, width: 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconPath,
                  height: 25, width: 23, color: AppColors.btnColor),
              const SizedBox(width: 10),
              Text(text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16))
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey)
        ],
      ),
    ),
  );
}

Widget _logoutButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding:
            const EdgeInsets.only(left: 10, top: 12, bottom: 12, right: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade400, width: 0.5),
            borderRadius: BorderRadius.circular(12)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Выйти из аккаунта',
                style: TextStyle(
                    color: AppColors.btnColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            Icon(Icons.logout_outlined, color: AppColors.btnColor),
          ],
        )),
  );
}
