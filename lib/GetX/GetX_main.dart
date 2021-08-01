import 'package:flutter/material.dart';
import 'package:flutter_exam/GetX/pages/Page_1.dart';
import 'package:flutter_exam/GetX/pages/Page_2.dart';
import 'package:get/get.dart';

class GetX_main extends StatefulWidget {
  const GetX_main({Key? key}) : super(key: key);

  @override
  _GetX_mainState createState() => _GetX_mainState();
}

class _GetX_mainState extends State<GetX_main> {
  var count = 0;

  // Widget text = Text("count $count");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => Page_1()); //페이지 이동
                },
                child: Text('Get.to'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.off(() =>
                      Page_1()); //이동한 페이지에서 뒤로가기 했을 때 현재 페이지는 건너뛰고 이전페이지로 이동
                  //ex) A -> B -> C로 이동, C에서 뒤로가기 했을 때 A로 이동
                },
                child: Text('Get.off'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => Page_1()); //페이지 이동 후 모든 스택 제러
                },
                child: Text('Get.offAll'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Get.back'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  var data = await Get.to(() => Page_1());
                  print("데이터 받아오기 결과 : $data");
                },
                child: Text('Get.back result data'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // Get.to(Page_2(), arguments:  "데이터 string 전달");
                  Get.to(() => Page_2(), arguments: "데이터 10 전달");
                  // var data = await Get.to(() => Page_1());
                  // print("데이터 받아오기 결과 : $data");
                },
                child: Text('argument 전달'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // Get.to(Page_2(), arguments:  "데이터 string 전달");
                  Get.to(() => Page_1(), transition: Transition.rightToLeft);
                  // var data = await Get.to(() => Page_1());
                  // print("데이터 받아오기 결과 : $data");
                },
                child: Text('트랜지션'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/page_4');
                },
                child: Text('네임드 라우트'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
