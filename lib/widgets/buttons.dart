
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    required this.icon,
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.buttonText,
              ),
              SizedBox(width: 16.w),
              Icon(
                icon,
                size: 24.sp,
                color: AppColors.teritaryColor,
              )
            ],
          )),
    );
  }
}
