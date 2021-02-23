import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payouts/screens/transaction_result.dart';
import 'package:payouts/widgets/amount_readonly.dart';
import 'package:payouts/widgets/appbar.dart';
import 'package:payouts/widgets/autocomplete.dart';
import 'package:payouts/widgets/button_accept.dart';
import 'package:payouts/widgets/label_colored.dart';
import 'package:payouts/widgets/textfield_card_num.dart';
import 'package:payouts/widgets/transaction_amount.dart';
import 'package:payouts/widgets/user_card.dart';

class WithdrawalPage extends StatefulWidget {
  // static const routeName = '/withdrawal-page';
  final String appbarText;

  WithdrawalPage(this.appbarText);

  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  bool amountBool = true;
  bool cardNumBool = true;
  bool cardDateBool = true;
  bool cardCVCBool = true;
  bool keyNotVisible = false;
  String label1 = 'Как гарант сделок мы берем ';
  String label3 = '5%';
  String label2 = ' комиссию и ';
  String label4 = ' банк 🚀';
  // String buttonLabel = 'Вывести';
  String transactionAmount = '0';
  String transactionCardNum;

  _updateButtonAmount(bool toggle) {
    setState(() {
      amountBool = toggle;
    });
  }

  _updateButtonCardNum(bool toggle) {
    setState(() {
      cardNumBool = toggle;
    });
  }

  _updateButtonCardDate(bool toggle) {
    setState(() {
      cardDateBool = toggle;
    });
  }

  _updateButtonCardCVC(bool toggle) {
    setState(() {
      cardCVCBool = toggle;
    });
  }

  _returnTransactionAmount(String amount) {
    setState(() {
      transactionAmount = amount;
    });
  }

  _returnChosenCardNum(String cardNum) {
    setState(() {
      transactionCardNum = cardNum;
    });
  }

  void makeTransaction(BuildContext ctx) {
    List transactionUser = [
      '@myprofile',
      'assets/images/myprofile.jpeg',
      'myprofileId'
    ];
    Navigator.of(ctx).push(
      CupertinoPageRoute(
        builder: (context) => TransactionResult(
          true,
          transactionUser,
          transactionAmount,
          'Перевод заказан',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        false,
        transactionAmount,
        _updateButtonAmount,
        _returnTransactionAmount,
        widget.appbarText,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Card(
                margin: const EdgeInsets.all(14.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: keyNotVisible
                      ? BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )
                      : BorderRadius.circular(30),
                ),
                child: TFCardNum(
                  updateButtonUser: _updateButtonCardNum,
                  returnChosenCardNum: _returnChosenCardNum,
                  txtInputType: TextInputType.number,
                  hintText: 'Банковская карта',
                  txtColor: Theme.of(context).primaryColor,
                  bgColor: Colors.white,
                  mask: 'xxxx xxxx xxxx xxxx',
                  separator: ' ',
                  txtAlign: TextAlign.start,
                ),
              ),
              widget.appbarText == 'Перевести'
                  ? Container()
                  : Card(
                      margin: const EdgeInsets.only(
                          bottom: 14.0, left: 14, right: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: keyNotVisible
                            ? BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )
                            : BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: TFCardNum(
                              updateButtonUser: _updateButtonCardDate,
                              returnChosenCardNum: _returnChosenCardNum,
                              txtInputType: TextInputType.datetime,
                              hintText: 'мм/гг',
                              txtColor: Theme.of(context).primaryColor,
                              bgColor: Colors.white,
                              mask: 'xx/xx',
                              separator: '/',
                              txtAlign: TextAlign.start,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: TFCardNum(
                              updateButtonUser: _updateButtonCardCVC,
                              returnChosenCardNum: _returnChosenCardNum,
                              txtInputType: TextInputType.number,
                              hintText: 'CVC',
                              txtColor: Colors.white,
                              bgColor: Theme.of(context).primaryColor,
                              mask: 'xxx',
                              separator: '',
                              txtAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
          Column(
            children: [
              // keyNotVisible ? Container() :
              // LabelColored(
              //   label1: label1,
              //   label2: label2,
              //   label3: label3,
              //   label4: label4,
              // ),
              ButtonAccept(
                disable: amountBool |
                    cardNumBool |
                    (widget.appbarText == 'Пополнить'
                        ? cardDateBool | cardCVCBool
                        : false),
                buttonLabel: widget.appbarText,
                makeTransaction: makeTransaction,
                userChosen: true,
                userValidation: null,
              )
            ],
          ),
        ],
      ),
    );
  }
}
