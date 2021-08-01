import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';

import 'CarouselController.dart';
import 'CarouselModel.dart';
import 'RemoteService.dart';

class Carousel_loading extends StatefulWidget {
  @override
  _Carousel_loadingState createState() => _Carousel_loadingState();
}

class _Carousel_loadingState extends State<Carousel_loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(width: 3),
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(width: 3),
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(width: 3),
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(width: 3),
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(width: 3),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // GetBuilder<CarouselController>(
                  //   builder: (_c) {
                  //     if (_c.isLoading) {
                  //       return Carousel_basic();
                  //     } else {
                  //       return Container();
                  //     }
                  //   },
                  // );
                  //
                  // print('CarouselController 버튼 클릭');
                  // try {
                  //   print('CarouselController 버튼 try');
                  //   CarouselController();
                  //   print('CarouselController 버튼 try222');
                  // } catch (e) {
                  //   print('CarouselController 버튼 클릭 eee : $e');
                  // }
                  // fetchCarousel();
                },
                child: Text("테스트 버튼입니다."))
          ],
        ),
      ),
    );
  }

  void fetchCarousel() async {
    print('CarouselController fetchCarousel start');
    try {
      List<CarouselModel> _data = await RemoteService.fetchCarouselData();
      if (_data != null) {
        print('data fetch _data : ${_data[0].image}');
      }
    } finally {
      print('data fetch done');
    }
  }
}
