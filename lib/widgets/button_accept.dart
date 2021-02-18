import 'package:flutter/material.dart';

class ButtonAccept extends StatelessWidget {
  final bool disable;
  final bool userChosen;
  final Function userValidation;
  final Function makeTransaction;
  final String buttonLabel;
  final double marginVert;

  ButtonAccept({
    @required this.disable,
    @required this.buttonLabel,
    @required this.makeTransaction,
    this.userChosen = true,
    this.userValidation,
    this.marginVert = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: marginVert),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        onPressed: disable
            ? null
            : (userChosen ? () => makeTransaction(context) : userValidation),
        color: marginVert == 15 ? Theme.of(context).primaryColor : Colors.white,
        disabledColor: Color(0xFFd3d3d3),
        textColor:
            marginVert == 15 ? Colors.white : Theme.of(context).primaryColor,
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
