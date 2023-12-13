import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pricewheel/bindings/onboarding_binding.dart';
import 'package:pricewheel/screens/onboarding/infos_screen.dart';
import 'package:pricewheel/screens/onboarding/occasion_screen.dart';
import 'package:pricewheel/screens/onboarding/options_screen.dart';
import 'package:pricewheel/screens/onboarding/result_screen.dart';
import 'package:pricewheel/screens/onboarding/welcome_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      binding: PriceBinding(),
    ),
    GetPage(
      name: Routes.options,
      page: () => const OptionsScreen(),
      binding: PriceBinding(),
    ),
    GetPage(
      name: Routes.infos,
      page: () => const InfosScreen(),
      binding: PriceBinding(),
    ),
    GetPage(
      name: Routes.occasion,
      page: () => const OccasionScreen(),
      binding: PriceBinding(),
    ),
    GetPage(
      name: Routes.result,
      page: () => const ResultScreen(),
      binding: PriceBinding(),
    ),

  ];
}
