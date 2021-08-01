import 'package:flutter_exam/Carousel/CarouselController.dart';
import 'package:get/get.dart';

class CarouselBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarouselController>(() => CarouselController());
  }
}
