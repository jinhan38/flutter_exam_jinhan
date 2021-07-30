import 'package:flutter/material.dart';

class Burger_page extends StatefulWidget {
  static const tag = "burger_pager";

  @override
  _Burger_pageState createState() => _Burger_pageState();
}

class _Burger_pageState extends State<Burger_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger page")
      ),
    );
  }
}
