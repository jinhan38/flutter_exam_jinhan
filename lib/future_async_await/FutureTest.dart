import 'package:flutter/material.dart';

class FutureTest extends StatefulWidget {
  const FutureTest({Key? key}) : super(key: key);

  @override
  _FutureTestState createState() => _FutureTestState();
}

class _FutureTestState extends State<FutureTest> {
  var resultText = "";
  var secondResultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('FutureTest'),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  futureValue();
                },
                child: Text('future task start')),
            SizedBox(height: 20.0),
            Text(resultText),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              thickness: 2.0,
              endIndent: 20.0,
              indent: 20.0,
            ),
            FutureBuilder(
                future: myFuture(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      // secondResultText,
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    );
                  }
                  return CircularProgressIndicator();
                  // return Text('fetching data...');
                })
          ],
        ),
      ),
    );
  }

  //여기서 Future.delayed 밖에서 setState를 호출하면 화면이 다시 그러지기 때문에
  //뒤에 있는 FutureBuilder도 초기화가 돼서 CircularProgressIndicator가 돌아간다.
  //그리고 snapshot.connectionState == ConnectionState.done 가 호출될 때 까지 프로그레스바가돌아간다.
  //futureValue의 2초가 지난 후에 myFuture에 진입해서 또다기 2초의 duration을 갖는다.
  void futureValue() {
    setState(() {
      this.resultText = "";
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        this.resultText = "future task is finished";
      });
    });
  }

  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 2));
    return 'second future completed';
  }
}
