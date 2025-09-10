// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:math';

class AppSize {
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;

  // Figma design dimensions
  static const double _figmaDesignWidth = 390;
  static const double _figmaDesignHeight = 844;

  // Initialize with context to get accurate MediaQuery data
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    // Account for safe area (status bar, notches, etc.)
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
  }

  // Alternative init method using window (but context-based is preferred)
  static void initFromWindow() {
    _mediaQueryData = MediaQueryData.fromView(ui.window);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
  }

  // Get screen width (total available width)
  static double get screenWidth => _screenWidth;

  // Get screen height (total available height)
  static double get screenHeight => _screenHeight;

  // Get usable width (excluding safe areas)
  static double get usableWidth => _screenWidth - _safeAreaHorizontal;

  // Get usable height (excluding safe areas like status bar)
  static double get usableHeight => _screenHeight - _safeAreaVertical;

  // Responsive width based on total screen width
  static double getWidth(double px) {
    return (px * _screenWidth) / _figmaDesignWidth;
  }

  // Responsive height based on total screen height
  static double getHeight(double px) {
    return (px * _screenHeight) / _figmaDesignHeight;
  }

  // Responsive width based on usable screen width (recommended)
  static double getResponsiveWidth(double px) {
    return (px * usableWidth) / _figmaDesignWidth;
  }

  // Responsive height based on usable screen height (recommended)
  static double getResponsiveHeight(double px) {
    return (px * usableHeight) /
        (_figmaDesignHeight -
            44); // 44 is approximate status bar height in Figma
  }

  // Get minimum of responsive width/height (for square elements)
  static double getSize(double px) {
    double height = getResponsiveHeight(px);
    double width = getResponsiveWidth(px);
    return height < width ? height : width;
  }

  // Font size based on minimum dimension
  static double fontSize(double px) {
    return getSize(px);
  }

  // Alternative font size that considers text scaling
  static double getAdaptiveFontSize(double px) {
    double fontSize = getSize(px);
    // Respect user's text scaling preferences but limit extreme scaling
    double textScaleFactor = _mediaQueryData.textScaleFactor.clamp(0.8, 1.3);
    return fontSize * textScaleFactor;
  }

  // Responsive padding
  static EdgeInsets getPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  // Responsive margin
  static EdgeInsets getMargin({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  // Internal method for margin/padding calculation
  static EdgeInsets getMarginOrPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    }
    return EdgeInsets.only(
      left: getResponsiveWidth(left ?? 0),
      top: getResponsiveHeight(top ?? 0),
      right: getResponsiveWidth(right ?? 0),
      bottom: getResponsiveHeight(bottom ?? 0),
    );
  }

  // Check device type
  static bool isTablet() {
    double diagonal = sqrt(pow(_screenWidth, 2) + pow(_screenHeight, 2));
    return diagonal > 1100; // Rough tablet detection
  }

  // Breakpoints for different screen sizes
  static bool isSmallScreen() => _screenWidth < 360;
  static bool isMediumScreen() => _screenWidth >= 360 && _screenWidth < 768;
  static bool isLargeScreen() => _screenWidth >= 768;
}

// Extension for double formatting
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
