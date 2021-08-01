
import 'package:flutter/material.dart';
import 'package:flutter_exam/dropDown/DropDownMain.dart';
import 'package:flutter_exam/future_async_await/FutureTest.dart';
import 'package:flutter_exam/hamburger/Hamburger.dart';
import 'package:flutter_exam/weather_app/WeatherMain.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Carousel/CarouselBasicScreen.dart';
import 'GetX/GetX_main.dart';
import 'carrotMarket/CarrotMain.dart';
import 'login_dice/LoginDiceApp.dart';
import 'login_with_firebase/LoginWithFirebase.dart';
import 'netflix/NetFlix_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'jinhanExample',
      // theme: ThemeData(primaryColor: Colors.blue),
      theme: ThemeData(
          cardColor: Colors.teal,
          // appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
          primaryColor: Colors.blue,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.orange),
          bottomAppBarColor: Colors.teal),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/dice': (context) => LoginDiceApp(),
        '/snsLogin': (context) => LoginWithFirebase(),
        '/futureTest': (context) => FutureTest(),
        '/weatherApp': (context) => WeatherMain(),
        '/hamburgerApp': (context) => Hamburger(),
        '/netFlix': (context) => NetFlix_main(),
        '/carousel_basic': (context) => CarouselBasicScreen(),
        '/dropDown': (context) => DropDownMain(),
        '/carrotMarket': (context) => CarrotMain(),
      },

    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jinhan example', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: [
                moveButton(
                    context: context, pushNamed: "/dice", text: '로그인/주사위'),
                moveButton(
                    context: context, pushNamed: "/snsLogin", text: 'SNS 로그인'),
                moveButton(
                    context: context,
                    pushNamed: "/futureTest",
                    text: 'Future Test basic'),
                moveButton(
                    context: context, pushNamed: "/weatherApp", text: '날씨앱'),
                moveButton(
                    context: context, pushNamed: "/hamburgerApp", text: '햄버거앱'),
                moveButton(
                    context: context, pushNamed: "/netFlix", text: '넷플릭스'),
                moveButton(
                    context: context,
                    pushNamed: "/carousel_basic",
                    text: '캐러셀 베이직'),
                moveButton(
                    context: context,
                    pushNamed: "/getX_main",
                    text: 'getX_main'),
                moveButton(
                    context: context,
                    pushNamed: "/dropDown",
                    text: 'dropDown'),
                moveButton(
                    context: context,
                    pushNamed: "/carrotMarket",
                    text: '당근마켓'),
                // moveButtonGet(
                //     text: 'GetX test',
                //     callback: () {
                //       Get.to(() => GetX_main());
                //     }),
                // moveButtonGet(
                //     text: 'GetX test page_4',
                    // callback: () {
                    //   // Get.to(() => Page_4());
                    //   Get.toNamed("/page_4",arguments: "asdf");
                    //   // Get.toNamed('/page_4/44ff');
                    // },
                    // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ScrollViewItem extends StatelessWidget {
  const ScrollViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Container moveButton(
    {required BuildContext context,
    required String text,
    required String pushNamed}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20.0),
    height: 45.0,
    child: Expanded(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, pushNamed);
          },
          child: Text(text,
              style: TextStyle(color: Colors.white, fontSize: 16.0))),
    ),
  );
}
