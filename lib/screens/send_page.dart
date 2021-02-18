import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:payouts/screens/transaction_result.dart';
import 'package:payouts/widgets/amount_readonly.dart';
import 'package:payouts/widgets/appbar.dart';
import 'package:payouts/widgets/autocomplete.dart';
import 'package:payouts/widgets/button_accept.dart';
import 'package:payouts/widgets/label_colored.dart';
import 'package:payouts/widgets/transaction_amount.dart';
import 'package:payouts/widgets/user_card.dart';

class SendPage extends StatefulWidget {
  // static const routeName = '/send-page';
  final String userId;
  final String userName;
  final String userImage;
  final String appbarText;

  SendPage(
    this.userId,
    this.userName,
    this.userImage,
    this.appbarText,
  );

  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  String userId;
  String userName;
  String userImage;
  bool amountBool = true;
  bool usernameBool;
  bool keyNotVisible = false;
  String greyLabel = 'Все транзакции';
  String blueLabel = ' под защитой 👌 комиссия 0%';
  String buttonLabel = 'Продолжить';
  bool userChosen = false;
  String transactionAmount = '0';
  List transactionUser;

  _updateButtonAmount(bool toggle) {
    setState(() {
      amountBool = toggle;
    });
  }

  _updateButtonUser(bool toggle) {
    setState(() {
      usernameBool = toggle;
    });
  }

  _updateLabel(bool toggle) {
    setState(() {
      keyNotVisible = toggle;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userImage = widget.userImage.isEmpty ? '' : widget.userImage;
    userId = widget.userId.isEmpty ? '' : widget.userId;
    userName = widget.userName.isEmpty ? '' : widget.userName;
    usernameBool = userName.isEmpty ? true : false;
    transactionUser = [userName, userImage, userId];
  }

  void userValidation() {
    setState(() {
      greyLabel = 'Юзер получит';
      blueLabel = ' уведомление 🙌 комиссия 0%'; //🙌🏻🙌
      buttonLabel = 'Перевести';
      userChosen = true;
    });
  }

  _returnTransactionAmount(String amount) {
    setState(() {
      transactionAmount = amount;
    });
  }

  _returnChosenUser(List user) {
    setState(() {
      transactionUser = user;
    });
  }

  void makeTransaction(BuildContext ctx) {
    Navigator.of(ctx).push(
      CupertinoPageRoute(
        builder: (context) => TransactionResult(
          true,
          transactionUser,
          transactionAmount,
          DateFormat('dd.MM.yyyy').format(DateTime.now()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        userChosen,
        transactionAmount,
        _updateButtonAmount,
        _returnTransactionAmount,
        widget.appbarText,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userChosen
              ? UserCard(
                  id: transactionUser[2],
                  title: transactionUser[0],
                  imageUrl: transactionUser[1],
                )
              : Card(
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
                  child: TFAutoComplete(
                    userName,
                    userImage,
                    _updateButtonUser,
                    _updateLabel,
                    _returnChosenUser,
                  ),
                ),
          Column(
            children: [
              keyNotVisible
                  ? Container()
                  : LabelColored(label1: greyLabel, label2: blueLabel),
              ButtonAccept(
                disable: amountBool | usernameBool,
                buttonLabel: buttonLabel,
                makeTransaction: makeTransaction,
                userChosen: userChosen,
                userValidation: userValidation,
              )
            ],
          ),
        ],
      ),
    );
  }
}
