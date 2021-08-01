import 'package:flutter/material.dart';
import 'package:flutter_exam/netflix/model/Model_movie.dart';

class Home_screen extends StatefulWidget {
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<Model_movie> movies = [
    Model_movie.fromMap({
      'title': '킹덤',
      'keyword': '좀비와의 전쟁',
      'poster': 'kingdom.jpg',
      'like': false
    })
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            TabBar(),
            // CarouselDemo(),
          ],
        )
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'image/glogo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
