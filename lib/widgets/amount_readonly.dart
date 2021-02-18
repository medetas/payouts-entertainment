import 'package:flutter/material.dart';

class AmountReadonly extends StatelessWidget {
  final String transactionAmount;
  final Color amountColor;

  AmountReadonly(this.transactionAmount, this.amountColor);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        controller: TextEditingController(text: transactionAmount),
        readOnly: true,
        style: TextStyle(
          color: amountColor,
          fontSize: 50,
          fontWeight: FontWeight.w800,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: Text(
            '₽',
            style: TextStyle(
              color: amountColor,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
