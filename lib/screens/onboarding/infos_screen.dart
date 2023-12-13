import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/screens/onboarding/options_screen.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';
import 'package:pricewheel/widgets/buttons.dart';

class InfosScreen extends GetView<PriceController> {
  const InfosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const PriceAppBar(
          value: 0.33,
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
                        "Choisir votre marque",
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
                              "Choisir votre marque",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedCompany.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedCompany.value = newValue!;
                              controller.getModelList();
                            },
                            items: controller.companyList
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
                        "Choisir votre modèle",
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
                              "Choisir votre modèle",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedModel.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedModel.value = newValue!;
                              controller.getYearList();
                            },
                            items: controller.modelList
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
                        "Choisir l'année de production",
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
                              "Choisir l'année de production",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedYear.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedYear.value = newValue!;
                              controller.getOptionList();
                            },
                            items: controller.yearList
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
                        "Nouveau ou occasion ?",
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
                              "Nouveau ou occasion ?",
                              style: AppTextStyle.descText,
                            ),
                            isExpanded: true,
                            value: controller.selectedOccasion.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24.sp,
                            elevation: 16,
                            style: AppTextStyle.descText,
                            underline: Container(
                              height: 2.h,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              controller.selectedOccasion.value = newValue!;
                            },
                            items: controller.occasionList
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
                    ],
                  ),
                  PrimaryButton(
                    width: double.infinity,
                    height: 56.h,
                    text: "Continue",
                    icon: Icons.arrow_right_alt_rounded,
                    onTap: () => Get.toNamed(Routes.options),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
