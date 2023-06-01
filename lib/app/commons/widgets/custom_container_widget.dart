import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';
import 'package:quiz_game/app/commons/styles/text_style.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';

class CustomContainerWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomContainerWidget({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.7,
        height: Get.width * 0.3,
        decoration: BoxDecoration(borderRadius: 5.circularRadius, color: AppColors.primaryColor),
        child: Center(
          child: Text(title, style: StyleText.size20BoldWhite),
        ),
      ),
    );
  }
}
