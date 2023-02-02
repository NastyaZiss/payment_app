import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payment_app/component/colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;

  final String text;
  const AppLargeButton(
      {super.key,
      this.backgroundColor: AppColor.mainColor,
      this.textColor,
      this.onTap,
      this.isBorder: false,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColor.mainColor),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 30, color: textColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
