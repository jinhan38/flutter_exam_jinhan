import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back(result: "뒤로가기 데이터 받아오기");
                },
                child: Text("뒤로가기"))
          ],
        ),
      ),
    );
  }
}
