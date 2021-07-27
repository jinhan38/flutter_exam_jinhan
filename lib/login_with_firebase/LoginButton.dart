import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  // LoginButton(this.image, this.text, this.color, this.radius, this.bottomMargin,
  //     this.onPressed);

  LoginButton.name(this.image, this.text, this.color, this.radius,
      this.bottomMargin, this.onPressed);

  late final Widget image;
  late final Widget text;
  late final Color color;
  late final double radius;
  late final double bottomMargin;
  late final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              primary: color,
              padding: EdgeInsets.all(0.0),
              fixedSize: Size(double.infinity, 50.0)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image,
              text,
              Opacity(
                opacity: 0.3,
                child: image,
              )
            ],
          )),
    );
  }
}
