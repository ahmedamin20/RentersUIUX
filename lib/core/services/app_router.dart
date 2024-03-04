import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/caching_data/cacshing_date.dart';
import 'package:ksb/views/pages/abous_us/about_us_view.dart';
import 'package:ksb/views/pages/all_restrunt_screen/view/screens.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/new_password_screen.dart';
import 'package:ksb/views/pages/auth/create_new_password.dart';
import 'package:ksb/views/pages/auth/login_view.dart';
import 'package:ksb/views/pages/auth/reset_password_view.dart';
import 'package:ksb/views/pages/auth/sign_up_view.dart';
import 'package:ksb/views/pages/auth/verification_view.dart';
import 'package:ksb/views/pages/contuct_us/contuct_us_view.dart';
import 'package:ksb/views/pages/edit_profile/edit_profile_screen.dart';
import 'package:ksb/views/pages/home_layout/page/home_layout.dart';
import 'package:ksb/views/pages/home/pick_interest.dart';
import 'package:ksb/views/pages/onbording/hello_screen.dart';
import 'package:ksb/views/pages/onbording/screen/Onboarding_screen.dart';
import 'package:ksb/views/pages/profile/page/change_language_Screen.dart';
import 'package:ksb/views/pages/profile/page/change_password_screen.dart';
import 'package:ksb/views/pages/profile/page/profile_settings_screen.dart';
import 'package:ksb/views/pages/settings/pages/settings_screen.dart';
import 'package:ksb/views/pages/start/start_view.dart';
import 'package:ksb/views/pages/splash/splash_view.dart';
import '../../views/pages/abous_us/about_app_view.dart';
import '../../views/pages/auth/antoneos_auth/congrats_screen.dart';
import '../../views/pages/auth/antoneos_auth/reset_password_Screen.dart';
import '../../views/pages/auth/antoneos_auth/widget/reset_password_widget.dart';
import '../../views/pages/product_details/product_details_screen.dart';
import '../../views/pages/profile/page/terms_and_condations.dart';

abstract class AppRouter {
  static const String splashView = "/";
  static const String onBoardingDetails = "/onBoardingDetails";
  static const String onBoardingHello = "/onBoardingHello";
  static const String recommendedScreen = "/RecommendedScreen";
  static const String sendCode = "/sendCode";
  static const String detailsRecommendedScreen = "/DetailsRecommendedScreen";
  static const String startView = "/startView";
  static const String loginView = "/loginView";
  static const String signupView = "/signUpView";
  static const String congratsScreen = "/CongratsScreen";
  static const String resetPasswordView = "/resetPasswordView";
  static const String homeLayOut = "/homeLayOut";
  static const String myWalletView = "/MyWalletView";
  static const String profileView = "/profileView";
  static const String profileSettingScreen = "/ProfileSettingScreen";
  static const String verificationView = "/verificationView";
  static const String createNewPassowrdView = "/createNewPasswordView";
  static const String homeView = "/homeView";
  static const String pickInterestView = "/pickInterestView";
  static const String detailsView = "/detailsView";
  static const String carsView = "/CarsView";
  static const String filterView = "/filterView";
  static const String notificationView = "/NotificationView";
  static const String myCarsview = "/myCarsView";
  static const String cardetails = "/cardetails";
  static const String settingsView = "/settings";
  static const String changePasswordView = "/changePasswordView";
  static const String carFixView = "/carFixView";
  static const String userVisitorView = "/userVisitorScreen";
  static const String notificationScreen = "/notificationScreen";
  static const String termsAndCondationView = "/termsAndConditionsView";
  static const String qrScreen = "/QrScreen";
  static const String bandScreen = "/BrandScreen";
  static const String recommendedItemDetails = "/RecommendedItemDetails";
  static const String newPassword = "/NewPassword";
  static const String language = "/language";
  static const String notificationItemDetails = "/notificationItemDetails";
  static const String aboutApp = "/aboutApp";
  static const String payment = "/payment";
  static const String editProfile = "/editProfile";
  static const String deliveryAddress = "/deliveryAddress";
  static const String notes = "/notes";
  static const String historyNote = "/historyNote";
  static const String noteDetails = "/noteDetails";
  static const String allRestaurantScreen = "/AllRestaurantScreen";
  static const String contactUs = "/contactUs";
  static const String supportChat = "/supportChat";
  static const String productDetailsScreen = "/productDetailsScreen";

  static final router = GoRouter(
    initialLocation: loginView,
      routes: [
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
    //     GoRoute(
    //   path: supportChat,
    //   builder: (context, state) =>
    //   ChatBetweenUserScreen(
    //       userID: CachingData.instance.getCachedLogin()!.data!.id.toString(),
    //       chatUserModel: ChatUserModel(
    //         name: CachingData.instance.getCachedLogin()!.data!.name,
    //         avatar: CachingData.instance.getCachedLogin()!.data!.avatar,
    //         otherUserId: 1,

    //       ),
    //       userModel: CachingData.instance.getCachedLogin()!.data!,
    //   ),
    // ),

    GoRoute(
      path: onBoardingDetails,
      builder: (context, state) => OnBoardingScreen(),
    ),

    GoRoute(
      path: congratsScreen,
      builder: (context, state) => const CongratsScreen(),
    ),

    GoRoute(
      path: onBoardingHello,
      builder: (context, state) => const HelloScreen(),
    ),

    GoRoute(
      path: startView,
      builder: (context, state) => const StartView(),
    ),
    GoRoute(
      path: loginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: signupView,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: resetPasswordView,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
      path: sendCode,
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
        path: homeLayOut,
        builder: (context, state) => const HomeLayout(),
        name: homeLayOut),
    GoRoute(
        path: profileSettingScreen,
        builder: (context, state) => const ProfileSettingScreen(),
        name: profileSettingScreen),
    GoRoute(
      path: createNewPassowrdView,
      builder: (context, state) {
        final email = state.extra as Map;
        return CreateNewPasswordView(
          email: email['email'],
          cubit: email['cubit'],
        );
      },
    ),
    GoRoute(
      path: pickInterestView,
      builder: (context, state) => const PickInterestView(),
    ),

    // GoRoute(
    //   path: detailsView,
    //   builder: (context, state) {
    //     final id = state.extra as Map;
    //     return DetailsView(id: id["id"]);
    //   },
    // ),
    // GoRoute(
    //     path: cardetails,
    //     builder: (context, state){
    //   final map = state.extra as Map;
    //   return CarDetialesView(id: map["id"],
    //   cubit: map["cubit"],
    //     carName: map["carName"],
    //   );
    // }),
    GoRoute(
        path: settingsView,
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
        path: verificationView,
        builder: (context, state) {
          final email = state.extra as Map;

          return VerificationView(
            email: email['email'],
          );
        }),

    GoRoute(
        path: changePasswordView,
        builder: (context, state) => const ChangePasswordScreen()),

        GoRoute(
            path: termsAndCondationView,
            builder: (context, state) => const TermsAndCondationScreen()),

        GoRoute(
            path: language,
            builder: (context, state) => const LanguageScreen()),
        GoRoute(
            path: newPassword,
            builder: (context, state) => const NewPasswordScreen()),
        GoRoute(
            path: aboutApp,
            builder: (context, state) => const AboutUsScreen()),
        GoRoute(
            path: editProfile,
            builder: (context, state) => const EditProfile()),
        GoRoute(
            path: contactUs,
            builder: (context, state) => const ContactUs()),
        GoRoute(
            path: productDetailsScreen,
            builder: (context, state) =>  ProductDetails(
              productId: state.extra as int,
            )),
        // Gor
  ]);

  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;
}
