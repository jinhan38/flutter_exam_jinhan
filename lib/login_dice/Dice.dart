import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('image/dice$leftDice.png')),
                  SizedBox(width: 30.0),
                  Expanded(child: Image.asset('image/dice$rightDice.png')),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                });
                showToast("leftDice : $leftDice, rightDice : $rightDice");
              },
              child: Icon(Icons.play_arrow, color: Colors.white, size: 50.0),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(0.0),
                  // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Colors.orangeAccent,
                  fixedSize: Size(100.0, 60.0)),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM);
}
