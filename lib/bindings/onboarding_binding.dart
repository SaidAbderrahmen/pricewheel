import 'package:get/get.dart';
import 'package:pricewheel/screens/onboarding/price_controller.dart';

class PriceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceController>(() => PriceController());
  }
}
