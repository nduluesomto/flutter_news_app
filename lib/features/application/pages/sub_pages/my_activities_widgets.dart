import 'package:flutter/material.dart';

Widget myActivities({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.only(top: 60, right: 15, left: 15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back,
                    size: 30, color: Colors.black)),
            const Text(
              'мои мероприятия',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.access_time_rounded,
                  size: 30,
                ))
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 600,
          child: ListView(
            children: [
              customWidget(
                  postTitle: 'Петербургский международный экономический форум',
                  postRole: "роль: дирекция и тех персонал",
                  postDuration: "16 - 19 фев"),
              customWidget(
                  postTitle: 'Восточный экономический форум',
                  postRole: "роль: дирекция и тех персонал",
                  postDuration: "20 - 25 фев"),
            ],
          ),
        )
      ],
    ),
  );
}

Widget customWidget({
  required String postTitle,
  required String postRole,
  required String postDuration,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(14)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
            child: Text(
                softWrap: true,
                maxLines: 3,
                postTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child:
                Image.asset('lib/assets/icons/smile.png', color: Colors.white),
          )
        ]),
        const SizedBox(height: 25),
        Text(postRole, style: TextStyle(color: Colors.grey.shade600)),
        const SizedBox(height: 6),
        Text(postDuration, style: TextStyle(color: Colors.grey.shade600))
      ],
    ),
  );
}
