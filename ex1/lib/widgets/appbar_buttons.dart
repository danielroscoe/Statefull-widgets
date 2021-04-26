import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppBarButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  AppBarButton({@required this.onPressed, @required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        child: RawMaterialButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      width: 35,
      height: 35,
      padding: EdgeInsets.all(1.5),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    );
  }
}
