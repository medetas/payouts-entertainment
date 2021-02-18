import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payouts/widgets/amount_readonly.dart';
import 'package:payouts/widgets/button_accept.dart';
import 'package:payouts/widgets/user_card.dart';

class TransactionResult extends StatelessWidget {
  final bool result;
  final List transactionUser;
  final String transactionAmount;
  final String transactionStatus;

  TransactionResult(
    this.result,
    this.transactionUser,
    this.transactionAmount,
    this.transactionStatus,
  );

  void backToMain(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:
            result ? Theme.of(context).primaryColor : Color(0xFFFD1111),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text(
          result ? 'Успешно!' : 'Ошибка',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,

            // alignment: Alignment.center,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: AmountReadonly(transactionAmount, Colors.white)),
                ),
                Flexible(
                  child: result
                      ? SvgPicture.asset('assets/images/success.svg')
                      : Image.asset('assets/images/fail.png'),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      transactionStatus,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(255, 255, 255, 0.25)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          UserCard(
            id: transactionUser[2],
            title: transactionUser[0],
            imageUrl: transactionUser[1],
          ),
          Container(),
          ButtonAccept(
            disable: false,
            makeTransaction: backToMain,
            buttonLabel: result ? 'Отлично' : 'Повторить',
          ),
        ],
      ),
    );
  }
}
