import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/assets.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';
import 'package:pricewheel/widgets/buttons.dart';

class WelcomeScreen extends GetView<PriceController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<PriceController>(
          init: PriceController(),
          initState: (_) {},
          builder: (controller) {
            return Stack(children: [
              Positioned(
                top: 290.h,
                left: 0,
                child: SvgPicture.asset(
                  AppAssets.background,
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      width: 164.w,
                      height: 132.h,
                    ),
                    SizedBox(height: 32.h),
                    Text.rich(
                      TextSpan(
                        text: "Bienvenue \n",
                        style: AppTextStyle.headerText,
                        children: [
                          TextSpan(
                            text: "Price",
                            style: AppTextStyle.headerText.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "Wheel",
                            style: AppTextStyle.headerText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Estimer le prix de votre voiture en quelques clics",
                      style: AppTextStyle.descText,
                    ),
                    SizedBox(height: 32.h),
                    Image.asset(
                      AppAssets.welcome,
                      width: 282.w,
                      height: 255.h,
                    ),
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: PrimaryButton(
                        width: double.infinity,
                        height: 56.h,
                        text: "Lancer l'estimation",
                        icon: Icons.arrow_right_alt_rounded,
                        onTap: () => Get.toNamed(Routes.infos),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
