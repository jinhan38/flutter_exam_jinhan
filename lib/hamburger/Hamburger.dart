import 'package:flutter/material.dart';
import 'package:flutter_exam/hamburger/Categories.dart';
import 'package:flutter_exam/hamburger/HambugerList.dart';

import 'Header.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: (Text("Deviver Me")),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
          ),
          Header(),
          Categories(),
          HamburgerList(row: 1),
          HamburgerList(row: 2),
        ],
      ),
      extendBody: true,
      //extendBody 를 true로 하면 shape: CircularNotchedRectangle() 만든 바텀네비의 곡선부분을 투명으로 만든다
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          // color: Colors.black38,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_alert,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.turned_in, color: Colors.white),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
