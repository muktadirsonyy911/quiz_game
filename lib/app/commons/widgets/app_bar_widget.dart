import 'package:flutter/material.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String viewName;
  const AppBarWidget({Key? key, required this.viewName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(viewName),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
