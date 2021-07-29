import 'package:flutter/material.dart';
import 'package:flutter_exam/future_async_await/FutureTest.dart';
import 'package:flutter_exam/hamburger/Hamburger.dart';
import 'package:flutter_exam/weather_app/WeatherMain.dart';
import 'login_dice/LoginDiceApp.dart';
import 'login_with_firebase/LoginWithFirebase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jinhanExample',
      // theme: ThemeData(primaryColor: Colors.blue),
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
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
        // '/future_async_await': (context) => Future_(),
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
      body: Column(
        children: [
          SizedBox(height: 15.0),
          moveButton(context: context, pushNamed: "/dice", text: '로그인/주사위'),
          moveButton(context: context, pushNamed: "/snsLogin", text: 'SNS 로그인'),
          moveButton(
              context: context,
              pushNamed: "/futureTest",
              text: 'Future Test basic'),
          moveButton(context: context, pushNamed: "/weatherApp", text: '날씨앱'),
          moveButton(
              context: context, pushNamed: "/hamburgerApp", text: '햄버거앱'),
        ],
      ),
    );
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
