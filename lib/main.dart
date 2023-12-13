import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pricewheel/consts/colors.dart';
import 'package:pricewheel/consts/globals.dart';
import 'package:pricewheel/routes/app_pages.dart';
import 'package:pricewheel/routes/app_routes.dart';
import 'package:pricewheel/services/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MainApp());
 
}
 initServices() async {
  await Get.putAsync(() => DbService().init());
  await dbService.getAllCarData();
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          initialRoute: Routes.welcome,
          getPages: AppPages.pages,
        );
      },
    );
  }
}