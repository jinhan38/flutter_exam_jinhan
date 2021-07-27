import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dice.dart';

class LoginDiceApp extends StatefulWidget {
  @override
  _LoginDiceAppState createState() => _LoginDiceAppState();
}

class _LoginDiceAppState extends State<LoginDiceApp> {
  var controller = TextEditingController();
  var controller2 = TextEditingController();

  // focusNode : 포커스를 받는 특정 위젯을 식별
  // focusScope : 어떤 위젯들까지 포커스를 받는지 범위를 나타냄


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              //모든 포커스를 해제
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration:
                                  InputDecoration(labelText: 'Enter dice'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                                  InputDecoration(labelText: 'Enter password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(height: 40.0),
                            ElevatedButton(
                                onPressed: () {
                                  if (controller.text == 'dice' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dice()));
                                  } else if (controller.text != 'dice' &&
                                      controller2.text == '1234') {
                                    showSnackBar(context);
                                  } else if (controller.text == 'dice' &&
                                      controller2.text != '1234') {
                                    showSnackBar2(context);
                                  } else {
                                    showSnackBar3(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(100.0, 50.0),
                                    primary: Colors.orangeAccent),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 35.0)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '아이디를 확인해주세요',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 1),
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 1),
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 확인해주세요',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 1),
  ));
}
