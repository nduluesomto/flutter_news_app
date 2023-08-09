import 'package:flutter/cupertino.dart';

loginBtn(
    Color bgColor, String btnName, void Function()? func, Color textColor) {
  return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(btnName,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16))),
      ));
}
