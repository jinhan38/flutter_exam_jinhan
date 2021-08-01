import 'package:flutter_exam/Carousel/CarouselModel.dart';
import 'package:flutter_exam/Carousel/RemoteService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CarouselController extends GetxController {
  var box = GetStorage();
  var isLoading = false;
  List<CarouselModel> carouselData = [];


  @override
  void onInit() {
    super.onInit();
    print('CarouselController onInit');
    fetchCarousel();
    print('CarouselController fetchCarousel finish');
    if (box.read('carouselData') != null) {
      carouselData.assignAll(box.read('carouselData'));
    }
  }

  void fetchCarousel() async {
    print('CarouselController fetchCarousel start');
    try {
      isLoading = true;
      update();
      List<CarouselModel> _data = await RemoteService.fetchCarouselData();
      if (_data != null) {
        print('data fetch _data : ${_data[0].image}');
        carouselData.assignAll(_data);
        box.write('carouselData', _data);
      }
    } finally {
      isLoading = false;
      update();
      print('data fetch done');
    }
  }
}
