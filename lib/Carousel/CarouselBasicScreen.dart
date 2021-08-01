import 'package:flutter/material.dart';
import 'package:flutter_exam/Carousel/Carousel_loading.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'CarouselController.dart';

class CarouselBasicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Carousel_basic(),
      body: GetBuilder<CarouselController>(
        builder: (controller) {
          if (controller.isLoading) {
            return Carousel_loading();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
