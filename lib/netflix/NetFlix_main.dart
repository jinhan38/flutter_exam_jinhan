import 'package:flutter/material.dart';
import 'package:flutter_exam/netflix/screen/Home_screen.dart';
import 'package:flutter_exam/netflix/widget/BottomBar.dart';

class NetFlix_main extends StatefulWidget {
  @override
  _NetFlix_mainState createState() => _NetFlix_mainState();
}

class _NetFlix_mainState extends State<NetFlix_main> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jinhan NetFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            //NeverScrollableScrollPhysics 손가락 모션으로 스크롤 기능을 막는 기능
            //다시 말해 뷰페이저 터치 스크롤 enable 설정
            children: [
              Home_screen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('more'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
