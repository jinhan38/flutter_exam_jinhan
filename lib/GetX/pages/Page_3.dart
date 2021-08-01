import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Page_3 extends StatefulWidget {

  @override
  _Page_3State createState() => _Page_3State();
}

class _Page_3State extends State<Page_3> {
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
