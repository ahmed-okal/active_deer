import 'package:get/get.dart';

/// Global transition configuration for all routes
class AppTransitions {
  AppTransitions._();

  /// Default transition type for all routes
  static const Transition defaultTransition = Transition.noTransition;

  /// Transition duration (100 milliseconds)
  static const Duration duration = Duration(milliseconds: 100);
}
