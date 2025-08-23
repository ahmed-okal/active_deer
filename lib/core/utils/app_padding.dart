import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppPadding {
  static EdgeInsetsGeometry get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: AppSize.getWidth(20));
  static EdgeInsetsGeometry get verticalPadding =>
      EdgeInsets.symmetric(vertical: AppSize.getHeight(20));
  static EdgeInsetsGeometry get allPadding =>
      EdgeInsets.all(AppSize.getHeight(20));
  static EdgeInsetsGeometry get topPadding =>
      EdgeInsets.only(top: AppSize.getHeight(20));
  static EdgeInsetsGeometry get bottomPadding =>
      EdgeInsets.only(bottom: AppSize.getHeight(20));
  static EdgeInsetsGeometry get startPadding =>
      EdgeInsetsDirectional.only(start: AppSize.getWidth(20));
  static EdgeInsetsGeometry get endPadding =>
      EdgeInsetsDirectional.only(end: AppSize.getWidth(20));
  static EdgeInsetsGeometry get suffixPadding =>
      EdgeInsetsDirectional.symmetric(
        vertical: AppSize.getHeight(9),
        horizontal: AppSize.getWidth(14),
      );
}
