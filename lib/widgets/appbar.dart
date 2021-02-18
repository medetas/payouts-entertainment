import 'package:flutter/material.dart';
import 'package:payouts/widgets/amount_readonly.dart';
import 'package:payouts/widgets/transaction_amount.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(170);

  final bool userChosen;
  final String transactionAmount;
  final Function updateButtonAmount;
  final Function returnTransactionAmount;
  final String appbarText;

  CustomAppBar(
    this.userChosen,
    this.transactionAmount,
    this.updateButtonAmount,
    this.returnTransactionAmount,
    this.appbarText,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: true,
      title: Text(
        appbarText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(115),
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: userChosen
              ? AmountReadonly(
                  transactionAmount, Theme.of(context).primaryColor)
              : TransactionAmount(updateButtonAmount, returnTransactionAmount),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
