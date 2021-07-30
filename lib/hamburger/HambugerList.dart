import 'package:flutter/material.dart';
import 'package:flutter_exam/hamburger/Burder_page.dart';

class HamburgerList extends StatefulWidget {
  final int row;

  HamburgerList({required this.row});

  @override
  _HamburgerListState createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  var items = 10;
  Widget burgerImage_1 = Container(
    height: 120,
    child: Image.asset("image/burger1.png"),
  );
  Widget burgerImage_2 = Container(
    height: 120,
    child: Image.asset("image/burger2.png"),
  );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: items,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2
                  ? index.isEven
                  : index.isOdd; //짝수 == ture, 홀수 == false
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 20, right: index == items ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Burger_page()));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                reverse ? "Burger" : "Burger Set",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "15,95 \$ CAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Burger_page()));
                      },
                      child: reverse ? burgerImage_1 : burgerImage_2,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
