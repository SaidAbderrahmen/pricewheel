import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';
import 'package:pricewheel/widgets/buttons.dart';

class ResultScreen extends GetView<PriceController> {
  const ResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<PriceController>(
          init: PriceController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
              child: Column(
                children: [
                  Image.network(
                    controller.carImage,
                    height: 180.h,
                    width: 350.w,
                  ),
                  SizedBox(height: 35.h),
                  Text(
                    controller.carFullName,
                    style: AppTextStyle.headerText.copyWith(fontSize: 24.sp),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 200.h,
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Occasion?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.selectedOccasion.value,
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Climatisation?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.options["Climatisation"]!
                                  ? "Oui"
                                  : "Non",
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vitres électriques?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.options["vitres électriques"]!
                                  ? "Oui"
                                  : "Non",
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Regulateur de vitesse?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.options["régulateur de vitesse"]!
                                  ? "Oui"
                                  : "Non",
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Toit ouvrant?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.options["toit ouvrant"]!
                                  ? "Oui"
                                  : "Non",
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kilometrage",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.selectedMileage.value.toString(),
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Age",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.selectedAge.value.toString(),
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Accidenté?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.selectedAccident.value,
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Moteur original?",
                              style: AppTextStyle.infoText,
                            ),
                            Text(
                              controller.selectedEngine.value,
                              style: AppTextStyle.infoText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Container(
                    height: 170.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.lightGray.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cette voiture est estimée à",
                          style: AppTextStyle.descText,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${controller.fullPrice} DT",
                          style: AppTextStyle.headerText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  PrimaryButton(
                    width: double.infinity,
                    height: 56.h,
                    text: "Estimer encore",
                    icon: Icons.arrow_right_alt_rounded,
                    onTap: () => Get.offAllNamed(Routes.welcome),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
