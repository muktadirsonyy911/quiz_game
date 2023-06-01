import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:quiz_game/app/commons/values/app_colors.dart';
import 'package:quiz_game/app/commons/extensions/extension_num.dart';

class CustomButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final double? height;
  final Widget child;
  final bool isBold;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final double? borderRadius;
  const CustomButtonWidget(
      {Key? key,
        this.onPressed,
        this.height,
        required this.child,
        this.fontSize,
        required this.isBold,
        this.textColor,
        this.backgroundColor,
        this.margin,
        this.borderRadius})
      : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  bool tappedDown = false;

  static const duration = Duration(milliseconds: 300);

  void tap() {
    setState(() => tappedDown = true);
  }

  void unTap() {
    setState(() => tappedDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.height ?? 46,
      margin: widget.margin,
      padding: EdgeInsets.all(tappedDown ? 4 : 0),
      duration: duration,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: widget.backgroundColor ?? AppColors.primaryColor,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          onTapUp: (details) => unTap(),
          onTapCancel: () => unTap(),
          onTapDown: (details) => tap(),
          onTap: widget.onPressed,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: duration,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: widget.textColor ?? context.theme.scaffoldBackgroundColor,
                fontSize: widget.fontSize ?? 15.0,
                fontWeight: widget.isBold == true ? FontWeight.bold : FontWeight.normal,
              ) ??
                  const TextStyle(),
              child: Padding(
                padding: 10.horizontalPadding,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
