import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Page_2 extends StatefulWidget {
  const Page_2({Key? key}) : super(key: key);

  @override
  _Page_2State createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("받아온 arguments : ${Get.arguments}")],
        ),
      ),
    );
  }
}
