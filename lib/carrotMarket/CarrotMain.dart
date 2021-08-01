import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/carrotMarket/CarrotData.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CarrotMain extends StatefulWidget {
  @override
  _CarrotMainState createState() => _CarrotMainState();
}

class _CarrotMainState extends State<CarrotMain> {
  List data = CarrotData().data;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: bodyWidget(),
      bottomNavigationBar: bottomNavigationWidget(),
    );
  }

  ///앱바위젯
  AppBar appBarWidget() {
    return AppBar(
      elevation: 0,
      // automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        child: Row(
          children: [
            Text(
              '당근마켓',
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'svg/carrot/bell.svg',
            width: 20,
          ),
        ),
      ],
    );
  }

  ///바디 위젯
  Widget bodyWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.asset(
                    data[index]["image"],
                    width: 100,
                    height: 100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["title"],
                          style: TextStyle(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data[index]["location"],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          calcStringToWon(data[index]["price"]),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/heart_off.svg",
                                  width: 13,
                                  height: 13,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  data[index]["likes"],
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            color: Colors.black.withOpacity(0.3),
          );
        },
        itemCount: 10);
  }

  //바텀내비 위젯젯
  Widget bottomNavigationWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
            print(index);
          });
        },
        currentIndex: _currentPageIndex,
        items: [
          _bottomNavigationBarItem("assets/svg/home_off.svg", '홈'),
          _bottomNavigationBarItem("assets/svg/notes_off.svg", '동네생활'),
          _bottomNavigationBarItem("assets/svg/location_off.svg", '내 근처'),
          _bottomNavigationBarItem("assets/svg/chat_off.svg", '채팅'),
          _bottomNavigationBarItem("assets/svg/user_off.svg", '나의 당근'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset("assets/svg/home_off.svg", width: 22,), label: '홈'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset("assets/svg/notes_off.svg", width: 22), label: '동네생활'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset("assets/svg/location_off.svg", width: 22), label: '내 근처'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset("assets/svg/chat_off.svg", width: 22), label: '채팅'),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset("assets/svg/user_off.svg", width: 22), label: '나의 당근'),
        ]);
  }

  //intl 라이브러리
  final oCcy = NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: SvgPicture.asset(
            iconName,
            width: 22,
          ),
        ),
        label: label);
  }
}
