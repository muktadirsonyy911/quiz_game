import 'package:flutter/cupertino.dart';

extension WidgetExtensions on num{
  /// size boxes
  get horizontalSpace => SizedBox(width: toDouble());
  get verticalSpace => SizedBox(height: toDouble());

  /// radius
  get circularRadius => BorderRadius.circular(toDouble());

  /// insets
  get allPadding => EdgeInsets.all(toDouble());
  get horizontalPadding => EdgeInsets.symmetric(horizontal: toDouble());
  get horizontalVerticalPadding => EdgeInsets.symmetric(horizontal: toDouble(), vertical: toDouble());
  get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
  get topPadding => EdgeInsets.only(top: toDouble());
  get bottomPadding => EdgeInsets.only(bottom: toDouble());
  get leftPadding => EdgeInsets.only(left: toDouble());
  get rightPadding => EdgeInsets.only(right: toDouble());
}