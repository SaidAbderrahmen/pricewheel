import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/screens/onboarding/options_screen.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';
import 'package:pricewheel/widgets/buttons.dart';

class OccasionScreen extends GetView<PriceController> {
  const OccasionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const PriceAppBar(
          value: 1,
        ),
      ),
      body: GetBuilder<PriceController>(
          init: PriceController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //dropdown
                      Text(
                        "Kilométrage",
                        style:
                            AppTextStyle.headerText.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 1.w,
                          ),
                        ),
                        child: Obx(
                          () => DropdownButton<String>(
                            hint: Text(
                              "Choisir votre kilométrage",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedMileage.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedMileage.value = newValue!;
                            },
                            items: controller.mileagePrice.keys
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyle.descText,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        "Age du véhicule",
                        style:
                            AppTextStyle.headerText.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 1.w,
                          ),
                        ),
                        child: Obx(
                          () => DropdownButton<String>(
                            hint: Text(
                              "Choisir l'age du véhicule",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedAge.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedAge.value = newValue!;
                            },
                            items: controller.agePrice.keys
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyle.descText,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        "Moteur original ?",
                        style:
                            AppTextStyle.headerText.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 1.w,
                          ),
                        ),
                        child: DropdownButton<String>(
                          hint: Text(
                            "Choisir une option",
                            style: AppTextStyle.descText,
                          ),
                          isExpanded: true,
                          value: controller.selectedEngine.value,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24.sp,
                          elevation: 16,
                          style: AppTextStyle.descText,
                          underline: Container(
                            height: 2.h,
                            color: const Color.fromARGB(0, 65, 48, 48),
                          ),
                          onChanged: (String? newValue) {
                            controller.selectedEngine.value = newValue!;
                            controller.update();
                          },
                          items: <String>[
                            'Selectionner une option',
                            'Oui',
                            'Non'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTextStyle.descText,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        "Accidenté ?",
                        style:
                            AppTextStyle.headerText.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.black,
                            width: 1.w,
                          ),
                        ),
                        child: DropdownButton<String>(
                          hint: Text(
                            "choisir une option",
                            style: AppTextStyle.descText,
                          ),
                          isExpanded: true,
                          value: controller.selectedAccident.value,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24.sp,
                          elevation: 16,
                          style: AppTextStyle.descText,
                          underline: Container(
                            height: 2.h,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            controller.selectedAccident.value = newValue!;
                            controller.update();
                          },
                          items: <String>[
                            'Selectionner une option',
                            'Oui',
                            'Non'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTextStyle.descText,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    width: double.infinity,
                    height: 56.h,
                    text: "Continue",
                    icon: Icons.arrow_right_alt_rounded,
                    onTap: () {
                      controller.calculateFullPrice();
                      Get.toNamed(Routes.result);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
