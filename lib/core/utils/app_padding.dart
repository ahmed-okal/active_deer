import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppPadding {
  static EdgeInsetsGeometry get horizontalPadding20 =>
      EdgeInsets.symmetric(horizontal: AppSize.getWidth(20));
  static EdgeInsetsGeometry get verticalPadding20 =>
      EdgeInsets.symmetric(vertical: AppSize.getHeight(20));
  static EdgeInsetsGeometry get allPadding20 =>
      EdgeInsets.all(AppSize.getHeight(20));
  static EdgeInsetsGeometry get topPadding20 =>
      EdgeInsets.only(top: AppSize.getHeight(20));
  static EdgeInsetsGeometry get topPadding10 =>
      EdgeInsets.only(top: AppSize.getHeight(10));
  static EdgeInsetsGeometry get bottomPadding20 =>
      EdgeInsets.only(bottom: AppSize.getHeight(20));
  static EdgeInsetsGeometry get startPadding20 =>
      EdgeInsetsDirectional.only(start: AppSize.getWidth(20));
  static EdgeInsetsGeometry get endPadding20 =>
      EdgeInsetsDirectional.only(end: AppSize.getWidth(20));
  static EdgeInsetsGeometry get suffixPadding =>
      EdgeInsetsDirectional.symmetric(
        vertical: AppSize.getHeight(9),
        horizontal: AppSize.getWidth(14),
      );
  static EdgeInsetsGeometry get horizontalPadding6 =>
      EdgeInsets.symmetric(horizontal: AppSize.getWidth(6));
  static EdgeInsetsGeometry get horizontalPadding25 =>
      EdgeInsets.symmetric(horizontal: AppSize.getWidth(25));
  static EdgeInsetsGeometry get verticalPadding25 =>
      EdgeInsets.symmetric(vertical: AppSize.getHeight(25));
  static EdgeInsetsGeometry get allPadding25 =>
      EdgeInsets.all(AppSize.getHeight(20));
  static EdgeInsetsGeometry get topPadding25 =>
      EdgeInsets.only(top: AppSize.getHeight(25));
  static EdgeInsetsGeometry get bottomPadding25 =>
      EdgeInsets.only(bottom: AppSize.getHeight(25));
  static EdgeInsetsGeometry get startPadding25 =>
      EdgeInsetsDirectional.only(start: AppSize.getWidth(25));
  static EdgeInsetsGeometry get endPadding25 =>
      EdgeInsetsDirectional.only(end: AppSize.getWidth(25));
  static EdgeInsetsGeometry get allPadding12 =>
      EdgeInsets.all(AppSize.getHeight(12));
  static EdgeInsetsGeometry get homeCardPadding => EdgeInsets.symmetric(
    horizontal: AppSize.getWidth(15),
    vertical: AppSize.getHeight(9),
  );
}
