import 'package:get/get.dart';

import '../../feature/edit_profile/presentation/getx/bindings/edit_profile_binding.dart';
import '../../feature/edit_profile/presentation/views/edit_profile_view.dart';
import '../../feature/about_us/presentation/getx/bindings/about_us_binding.dart';
import '../../feature/about_us/presentation/views/about_us_view.dart';
import '../../feature/auth/presentation/getx/bindings/login_binding.dart';
import '../../feature/auth/presentation/views/auth_view.dart';
import '../../feature/auth/presentation/views/change_password_success.dart';
import '../../feature/auth/presentation/views/create_new_password.dart';
import '../../feature/auth/presentation/views/enter_pin_view.dart';
import '../../feature/auth/presentation/views/forgot_password_view.dart';
import '../../feature/auth/presentation/views/terms_and_conditions_view.dart';
import '../../feature/book_fitness_class/presentation/getx/bindings/book_fitness_class_binding.dart';
import '../../feature/book_fitness_class/presentation/views/book_exercise.dart';
import '../../feature/book_fitness_class/presentation/views/book_fitness_class_view.dart';
import '../../feature/book_fitness_class/presentation/views/book_success.dart';
import '../../feature/club_branchs/presentation/getx/bindings/club_branchs_binding.dart';
import '../../feature/club_branchs/presentation/views/club_branchs_view.dart';
import '../../feature/language/getx/bindings/language_binding.dart';
import '../../feature/language/views/language_view.dart';
import '../../feature/more/presentation/getx/bindings/my_acount_binding.dart';
import '../../feature/more/presentation/views/my_acount_view.dart';
import '../../feature/notification/presentation/getx/bindings/notification_binding.dart';
import '../../feature/notification/presentation/views/notification_view.dart';
import '../../feature/nutritional_advice/presentation/getx/bindings/nutritional_advice_binding.dart';
import '../../feature/nutritional_advice/presentation/views/advice_view.dart';
import '../../feature/nutritional_advice/presentation/views/nutritional_advice_view.dart';
import '../../feature/offers/presentation/getx/bindings/offers_binding.dart';
import '../../feature/offers/presentation/views/offers_view.dart';
import '../../feature/payment/presentation/getx/bindings/payment_binding.dart';
import '../../feature/payment/presentation/views/payment_success.dart';
import '../../feature/payment/presentation/views/payment_view.dart';
import '../../feature/payment/presentation/views/saved_cards_view.dart';
import '../../feature/waiver/presentation/getx/bindings/waiver_binding.dart';
import '../../feature/waiver/presentation/view/waiver_view.dart';
import '../widgets/main_navigation_binding.dart';
import '../widgets/main_navigation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.auth;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const MainNavigationView(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.offers,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.nutritionalAdvice,
      page: () => const NutritionalAdviceView(),
      binding: NutritionalAdviceBinding(),
    ),
    GetPage(
      name: _Paths.advice,
      page: () => const AdviceView(),
      binding: NutritionalAdviceBinding(),
    ),
    GetPage(
      name: _Paths.bookFitnessClass,
      page: () => const BookFitnessClassView(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.bookExercise,
      page: () => const BookExercise(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.bookSuccess,
      page: () => const BookingSuccessPage(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.passwordSuccess,
      page: () => const PasswordChangeSuccessPage(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.enterPin,
      page: () => const EnterPinView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.createNewPassword,
      page: () => const CreateNewPasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.notification,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.payment,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.savedCards,
      page: () => const SavedCardsView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.paymentSuccess,
      page: () => const PaymentSuccessView(),
    ),
    GetPage(
      name: _Paths.termsAndConditions,
      page: () => const TermsAndConditionsView(),
    ),
    GetPage(
      name: _Paths.myAcount,
      page: () => const MyAcountView(),
      binding: MyAcountBinding(),
    ),
    GetPage(
      name: _Paths.clubBranchs,
      page: () => const ClubBranchsView(),
      binding: ClubBranchsBinding(),
    ),
    GetPage(
      name: _Paths.aboutUs,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.language,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.editProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.waiver,
      page: () => const WaiverView(),
      binding: WaiverBinding(),
    ),
  ];
}
