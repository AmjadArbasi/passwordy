import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: AppRoutes.skeleton, page: () => const Skeleton()),
    GetPage(name: AppRoutes.home, page: () => const Home()),
    GetPage(name: AppRoutes.vault, page: () => const Vault()),
    GetPage(name: AppRoutes.profile, page: () => const Profile()),
    GetPage(name: AppRoutes.saveCatchword, page: () => const SaveCatchword()),
    GetPage(name: AppRoutes.viewCatchword, page: () => const CatchwordView()),
    GetPage(name: AppRoutes.saveCategory, page: () => const SaveCategory()),
    GetPage(name: AppRoutes.general, page: () => const General()),
    GetPage(name: AppRoutes.about, page: () => const About()),
    GetPage(name: AppRoutes.activitiesLog, page: () => const ActivitiesLog()),
    GetPage(name: AppRoutes.onBoarding, page: () => const Onboarding()),
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.translator, page: () => const TranslatorPage()),
    GetPage(name: AppRoutes.signIn, page: () => const SignIn()),
    GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
    GetPage(name: AppRoutes.welcome, page: () => const WelcomePage()),
    GetPage(
        name: AppRoutes.resetPassword, page: () => const ResetMasterPasscode()),
  ];
}
