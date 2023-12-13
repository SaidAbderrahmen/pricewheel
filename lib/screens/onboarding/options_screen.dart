import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';
import 'package:pricewheel/widgets/buttons.dart';

class OptionsScreen extends GetView<PriceController> {
  const OptionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const PriceAppBar(
          value: 0.66,
        ),
      ),
      body: GetBuilder<PriceController>(
          init: PriceController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 450.h,
                      child: ListView.builder(
                          itemCount: controller.options.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //dropdown
                                Text(
                                  controller.options.keys.elementAt(index),
                                  style: AppTextStyle.headerText
                                      .copyWith(fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.transparent,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: controller.options.values
                                            .elementAt(index)
                                        ? "Oui"
                                        : "Non",
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 24.sp,
                                    elevation: 16,
                                    style: AppTextStyle.descText,
                                    underline: Container(
                                      height: 2.h,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (String? newValue) {
                                      controller.options.update(
                                          controller.options.keys
                                              .elementAt(index),
                                          (value) =>
                                              newValue == "Oui" ? true : false);
                                      controller.update();
                                    },
                                    items: <String>['Oui', 'Non']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                              ],
                            );
                          })),
                  PrimaryButton(
                    width: double.infinity,
                    height: 56.h,
                    text: "Continue",
                    icon: Icons.arrow_right_alt_rounded,
                    onTap: () => Get.toNamed(Routes.occasion),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class PriceAppBar extends StatelessWidget {
  const PriceAppBar({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        titleSpacing: 0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: Get.back,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.textColor,
                  size: 24.sp,
                ),
              ),
              SizedBox(
                width: 168.w,
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: AppColors.secondaryColor,
                  color: AppColors.textColor,
                  minHeight: 8.h,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Skip", style: AppTextStyle.descText),
              ),
            ],
          ),
        ));
  }
}
