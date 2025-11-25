import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({required this.page})
    : super(
        pageBuilder: (context, animation, animationTwo) => page,
        transitionsBuilder: (context, animation, animationTwo, child) {
          Offset begin = const Offset(-1, 0);
          Offset end = const Offset(0, 0);
          Tween<Offset> tween = Tween(begin: begin, end: end);
          CurvedAnimation curvesAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.bounceIn,
          );
          return SlideTransition(
            position: tween.animate(curvesAnimation),
            child: child,
          );
        },
      );
}

class SlideToBottom extends PageRouteBuilder {
  final Widget page;
  SlideToBottom({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide in from bottom
          const Offset begin = Offset(0, 1);
          const Offset end = Offset(0, 0);
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}

class SlideToLeft extends PageRouteBuilder {
  final Widget page;
  SlideToLeft({required this.page})
    : super(
        pageBuilder: (context, animation, animationTwo) => page,
        transitionsBuilder: (context, animation, animationTwo, child) {
          Offset begin = const Offset(1, 0);
          Offset end = const Offset(0, 0);
          Tween<Offset> tween = Tween(begin: begin, end: end);
          CurvedAnimation curvesAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return SlideTransition(
            position: tween.animate(curvesAnimation),
            child: child,
          );
        },
      );
}

class ScaleTransitionAnimation extends PageRouteBuilder {
  final Widget page;
  ScaleTransitionAnimation({required this.page})
    : super(
        pageBuilder: (context, animation, animationTwo) => page,
        transitionsBuilder: (context, animation, animationTwo, child) {
          double begin = 0.0;
          double end = 1.0;
          Tween<double> tween = Tween(begin: begin, end: end);
          CurvedAnimation curvesAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return ScaleTransition(
            scale: tween.animate(curvesAnimation),
            child: child,
          );
        },
      );
}

class SizeTransitionAnimation extends PageRouteBuilder {
  final Widget page;
  SizeTransitionAnimation({required this.page})
    : super(
        pageBuilder: (context, animation, animationTwo) => page,
        transitionsBuilder: (context, animation, animationTwo, child) {
          return Align(
            child: SizeTransition(sizeFactor: animation, child: child),
          );
        },
      );
}

class FadeTransitionAnimation extends PageRouteBuilder {
  final Widget page;
  FadeTransitionAnimation({required this.page})
    : super(
        pageBuilder: (context, animation, animationTwo) => page,
        transitionsBuilder: (context, animation, animationTwo, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
}

class BouncingCupertinoPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  BouncingCupertinoPageRoute({required this.builder})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) =>
            builder(context),
        opaque: false, // Transparent background
        barrierColor: null, // No grey barrier
        transitionDuration: const Duration(milliseconds: 800), // Push duration
        reverseTransitionDuration: const Duration(
          milliseconds: 400,
        ), // Pop duration
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Bouncing animation for the entering page (push only)
          final bounceAnimation = CurvedAnimation(
            parent: animation,
            curve: animation.status == AnimationStatus.forward
                ? Curves
                      .easeOutBack // Bounce when pushing
                : Curves.easeOut, // Smooth when popping
          );

          // Standard animation for the exiting page (no bounce)
          final standardAnimation = CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeOut, // Always smooth
          );

          // Slide in the new page with a bounce (push) or smoothly (pop)
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), // From right
              end: Offset.zero,
            ).animate(bounceAnimation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(-0.3, 0.0), // Slide out to left
              ).animate(standardAnimation),
              child: child,
            ),
          );
        },
      );
}

class TransparentModalRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  TransparentModalRoute({required this.builder});

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => AppColors.transparent;

  @override
  String get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SizeTransition(sizeFactor: animation, child: builder(context));
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get maintainState => true;
}

class CustomSlideToLeftTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
          .animate(
            CurvedAnimation(
              parent: animation,
              curve: curve ?? Curves.easeInOut,
            ),
          ),
      child: child,
    );
  }
}

class NoAnimationRoute extends PageRouteBuilder {
  final Widget page;
  NoAnimationRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      );
}
