import 'package:active_deer/core/routes/app_navgation_animation.dart';
import 'package:active_deer/core/routes/app_pages.dart';
import 'package:active_deer/feature/about_us/presentation/getx/bindings/about_us_binding.dart';
import 'package:active_deer/feature/about_us/presentation/views/about_us_view.dart';
import 'package:active_deer/feature/auth/presentation/getx/bindings/login_binding.dart';
import 'package:active_deer/feature/auth/presentation/views/auth_view.dart';
import 'package:active_deer/feature/auth/presentation/views/change_password_success.dart';
import 'package:active_deer/feature/auth/presentation/views/create_new_password.dart';
import 'package:active_deer/feature/auth/presentation/views/enter_pin_view.dart';
import 'package:active_deer/feature/auth/presentation/views/forgot_password_view.dart';
import 'package:active_deer/feature/auth/presentation/views/terms_and_conditions_view.dart';
import 'package:active_deer/feature/book_fitness_class/presentation/getx/bindings/book_fitness_class_binding.dart';
import 'package:active_deer/feature/book_fitness_class/presentation/views/book_exercise.dart';
import 'package:active_deer/feature/book_fitness_class/presentation/views/book_fitness_class_view.dart';
import 'package:active_deer/feature/book_fitness_class/presentation/views/book_success.dart';
import 'package:active_deer/feature/club_branchs/presentation/getx/bindings/club_branchs_binding.dart';
import 'package:active_deer/feature/club_branchs/presentation/views/club_branchs_view.dart';
import 'package:active_deer/feature/edit_profile/presentation/getx/bindings/edit_profile_binding.dart';
import 'package:active_deer/feature/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:active_deer/feature/language/getx/bindings/language_binding.dart';
import 'package:active_deer/feature/language/views/language_view.dart';
import 'package:active_deer/feature/more/presentation/getx/bindings/my_acount_binding.dart';
import 'package:active_deer/feature/more/presentation/views/my_acount_view.dart';
import 'package:active_deer/feature/notification/presentation/getx/bindings/notification_binding.dart';
import 'package:active_deer/feature/notification/presentation/views/notification_view.dart';
import 'package:active_deer/feature/nutritional_advice/presentation/getx/bindings/nutritional_advice_binding.dart';
import 'package:active_deer/feature/nutritional_advice/presentation/views/advice_view.dart';
import 'package:active_deer/feature/nutritional_advice/presentation/views/nutritional_advice_view.dart';
import 'package:active_deer/feature/offers/presentation/getx/bindings/offers_binding.dart';
import 'package:active_deer/feature/offers/presentation/views/offers_view.dart';
import 'package:active_deer/feature/payment/presentation/getx/bindings/payment_binding.dart';
import 'package:active_deer/feature/payment/presentation/views/payment_success.dart';
import 'package:active_deer/feature/payment/presentation/views/payment_view.dart';
import 'package:active_deer/feature/payment/presentation/views/saved_cards_view.dart';
import 'package:active_deer/feature/waiver/presentation/getx/bindings/waiver_binding.dart';
import 'package:active_deer/feature/waiver/presentation/view/waiver_view.dart';
import 'package:active_deer/core/widgets/main_navigation_binding.dart';
import 'package:active_deer/core/widgets/main_navigation_view.dart';
import 'package:active_deer/core/views/error_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        MainNavigationBinding().dependencies();
        return SlideToLeft(page: const MainNavigationView());

      case Routes.auth:
        LoginBinding().dependencies();
        return SlideToLeft(page: const AuthView());

      case Routes.offers:
        OffersBinding().dependencies();
        return SlideToLeft(page: const OffersView());

      case Routes.nutritionalAdvice:
        NutritionalAdviceBinding().dependencies();
        return SlideToLeft(page: const NutritionalAdviceView());

      case Routes.advice:
        NutritionalAdviceBinding().dependencies();
        return SlideToLeft(page: const AdviceView());

      case Routes.bookFitnessClass:
        BookFitnessClassBinding().dependencies();
        return SlideToLeft(page: const BookFitnessClassView());

      case Routes.bookExercise:
        BookFitnessClassBinding().dependencies();
        return SlideToLeft(page: const BookExercise());

      case Routes.bookSuccess:
        BookFitnessClassBinding().dependencies();
        return SlideToLeft(page: const BookingSuccessPage());

      case Routes.passwordSuccess:
        return SlideToLeft(page: const PasswordChangeSuccessPage());

      case Routes.forgotPassword:
        LoginBinding().dependencies();
        return SlideToLeft(page: const ForgotPasswordView());

      case Routes.enterPin:
        LoginBinding().dependencies();
        return SlideToLeft(page: const EnterPinView());

      case Routes.createNewPassword:
        LoginBinding().dependencies();
        return SlideToLeft(page: const CreateNewPasswordView());

      case Routes.notification:
        NotificationBinding().dependencies();
        return SlideToLeft(page: const NotificationView());

      case Routes.payment:
        PaymentBinding().dependencies();
        return SlideToLeft(page: const PaymentView());

      case Routes.savedCards:
        PaymentBinding().dependencies();
        return SlideToLeft(page: const SavedCardsView());

      case Routes.paymentSuccess:
        return SlideToLeft(page: const PaymentSuccessView());

      case Routes.termsAndConditions:
        return SlideToLeft(page: const TermsAndConditionsView());

      case Routes.myAcount:
        MyAcountBinding().dependencies();
        return SlideToLeft(page: const MyAcountView());

      case Routes.clubBranchs:
        ClubBranchsBinding().dependencies();
        return SlideToLeft(page: const ClubBranchsView());

      case Routes.aboutUs:
        AboutUsBinding().dependencies();
        return SlideToLeft(page: const AboutUsView());

      case Routes.language:
        LanguageBinding().dependencies();
        return SlideToLeft(page: const LanguageView());

      case Routes.editProfile:
        EditProfileBinding().dependencies();
        return SlideToLeft(page: const EditProfileView());

      case Routes.waiver:
        WaiverBinding().dependencies();
        return SlideToLeft(page: const WaiverView());

      default:
        return SlideToLeft(
          page: const ErrorView(errorMessage: "Route not found"),
        );
    }
  }
}
