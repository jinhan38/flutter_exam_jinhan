import 'package:flutter/material.dart';
import 'package:flutter_exam/login_with_firebase/LoginButton.dart';

class LoginWithFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SNS 로그인'),
        backgroundColor: Colors.blue,
      ),
      body: _buildButton(),
    );
  }

  // _ underScore를 붙이면 private 역할 을 한다.
  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LoginButton.name(
              Image.asset('image/glogo.png', width: 40.0, height: 40.0),
              Text('Login with Google',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0)),
              Colors.white,
              10.0,
              15.0,
              () {}),
          LoginButton.name(
              Image.asset('image/flogo.png', width: 40.0, height: 40.0),
              Text('Login with Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              Color(0xFF334D92),
              10.0,
              15.0,
              () {}),
          LoginButton.name(
              Icon(Icons.mail, color: Colors.white, size: 35.0),
              Text('Login with Email',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              Colors.green,
              10.0,
              40.0,
              () {}),
        ],
      ),
    );
  }
}
