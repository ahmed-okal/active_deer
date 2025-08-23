import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

/// Theme-aware text styles
class AppTextTheme {
  static const _fontFamily = 'Cairo';
  static TextStyle primary300({
    FontWeight weight = FontWeight.w300,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary400({
    FontWeight weight = FontWeight.w400,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary500({
    FontWeight weight = FontWeight.w500,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary600({
    FontWeight weight = FontWeight.w600,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary700({
    FontWeight weight = FontWeight.w700,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary800({
    FontWeight weight = FontWeight.w800,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle primary900({
    FontWeight weight = FontWeight.w900,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.primary,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle white700({
    FontWeight weight = FontWeight.w700,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.white,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle secondary400({
    FontWeight weight = FontWeight.w400,
    Color? customColor,
    required double size,
  }) {
    return TextStyle(
      fontSize: AppSize.getSize(size),
      fontWeight: weight,
      color: AppColors.secondry,
      fontFamily: _fontFamily,
    );
  }
}
