import 'package:active_deer/core/widgets/loading_widget.dart';
import 'package:active_deer/feature/auth/presentation/getx/controllers/auth_controller.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/auth_sliver_app_bar.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/login_body.dart';
import 'package:active_deer/feature/auth/presentation/views/widgets/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/size_config.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.signUpController.isLoading.value
          ? const LoadingWidget()
          : SafeArea(
              top: false,
              child: CustomScrollView(
                slivers: [
                  const AuthSliverAppBar(),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: AppSize.getHeight(12)),
                        Center(
                          child: Text(
                            'welcome'.tr,
                            style: AppTextTheme.primary800(size: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            'pleaseEnerYourLoginInfo'.tr,
                            style: AppTextTheme.primary600(size: 18),
                          ),
                        ),
                        SizedBox(height: AppSize.getHeight(42)),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return SlideTransition(
                                position:
                                    Tween<Offset>(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOut,
                                      ),
                                    ),
                                child: child,
                              );
                            },
                        child: controller.currentPage.value == 0
                            ? const LoginBody()
                            : const SignUpBody(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
