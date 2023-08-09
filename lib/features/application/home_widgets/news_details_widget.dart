import 'package:flutter/material.dart';

Widget buildSheet(
    {required BuildContext context,
    required String imgPath,
    required String newsTitle,
    required String publishedDate,
    required String publishedTime,
    required String newsDetails}) {
  return SizedBox(
    height: 780,
    child: Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                const Text(
                  'Новость',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 670,
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(children: [
                      Image.asset(
                          fit: BoxFit.cover, imgPath, width: 360, height: 190),
                      Positioned(
                          right: 12,
                          top: 12,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                                height: 24,
                                width: 24,
                                'lib/assets/icons/forward.png'),
                          ))
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Text(newsTitle,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 19)),
                  const SizedBox(height: 15),
                  Row(children: [
                    Text(publishedDate,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13)),
                    const SizedBox(width: 5),
                    const Text('.'),
                    const SizedBox(width: 5),
                    Text(publishedTime,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13)),
                  ]),
                  const SizedBox(height: 20),
                  Text(newsDetails,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5))
                ],
              ),
            )
          ],
        )),
  );
}
