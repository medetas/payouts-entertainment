import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payouts/screens/send_page.dart';
import 'package:payouts/screens/withdrawal_page.dart';

class OperationCard extends StatelessWidget {
  final String id;
  final String title;
  final String icon;

  OperationCard(this.id, this.title, this.icon);

  void operationPressed(BuildContext ctx) {
    switch (title) {
      case 'Пополнить':
        Navigator.of(ctx).push(CupertinoPageRoute(
            builder: (context) => WithdrawalPage('Пополнить')));
        break;
      case 'Отправить':
        Navigator.of(ctx).push(CupertinoPageRoute(
            builder: (context) => SendPage('', '', '', 'Отправить')));
        break;
      case 'Перевести':
        Navigator.of(ctx).push(CupertinoPageRoute(
            builder: (context) => WithdrawalPage('Перевести')));
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RawMaterialButton(
          elevation: 0,
          onPressed: () => operationPressed(context),
          fillColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(17.5),
            child: SvgPicture.asset(icon),
          ),
          shape: CircleBorder(),
        ),
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 5),
          child: AutoSizeText(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
