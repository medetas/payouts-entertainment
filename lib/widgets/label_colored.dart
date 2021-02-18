import 'package:flutter/material.dart';

class LabelColored extends StatelessWidget {
  final String label1;
  final String label2;
  final String label3;
  final String label4;

  LabelColored({
    @required this.label1,
    @required this.label2,
    this.label3 = '',
    this.label4 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16),
          children: [
            TextSpan(
              text: label1,
              style: TextStyle(
                color: label3.isEmpty
                    ? Colors.grey[400].withOpacity(0.5)
                    : Theme.of(context).primaryColor,
              ),
            ),
            label3.isEmpty
                ? TextSpan()
                : TextSpan(
                    text: '\n' + label3,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
            TextSpan(
              text: label2,
              style: TextStyle(
                color: label3.isEmpty
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400].withOpacity(0.5),
              ),
            ),
            label3.isEmpty
                ? TextSpan()
                : TextSpan(
                    text: label3,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
            label3.isEmpty
                ? TextSpan()
                : TextSpan(
                    text: label4,
                    style: TextStyle(
                      color: Colors.grey[400].withOpacity(0.5),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
