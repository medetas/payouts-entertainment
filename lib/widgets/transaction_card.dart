import 'package:flutter/material.dart';
import 'package:payouts/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String date;
  final int amount;
  final String destinationUser;
  final TransactionType transactionType;
  final int order;

  TransactionCard({
    this.amount,
    this.date,
    this.destinationUser,
    this.id,
    this.transactionType,
    this.order,
  });

  List get transactionTypeText {
    switch (transactionType) {
      case TransactionType.Bonus:
        return ['+', 'Бонус', Color(0xFF1152FD)];
        break;
      case TransactionType.Proceeds:
        return ['+', 'Поступление', Color(0xFF1152FD)];
        break;
      case TransactionType.Refund:
        return ['+', 'Возврат', Color(0xFF1152FD)];
        break;
      case TransactionType.Transfer:
        return ['-', 'Перевод', Colors.black];
        break;
      case TransactionType.Withdrawal:
        return ['-', 'Вывод', Colors.black];
        break;
      default:
        return ['', 'Unknown', Colors.black];
    }
  }

  String formatDecimal(int number) {
    if (number > -1000 && number < 1000) return number.toString();

    final String digits = number.abs().toString();
    final StringBuffer result = StringBuffer(number < 0 ? '-' : '');
    final int maxDigitIndex = digits.length - 1;
    for (int i = 0; i <= maxDigitIndex; i += 1) {
      result.write(digits[i]);
      if (i < maxDigitIndex && (maxDigitIndex - i) % 3 == 0) result.write(' ');
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    // Color trColor =
    //     order % 2 == 0 ? Colors.black : Theme.of(context).primaryColor;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Color.fromRGBO(62, 73, 88, 0.6),
                    fontSize: 13,
                  ),
                ),
                Text(
                  transactionTypeText[1],
                  style: TextStyle(
                    color: Color.fromRGBO(62, 73, 88, 0.6),
                    fontSize: 13,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${transactionTypeText[0]} ${formatDecimal(amount)} ₽',
                  style: TextStyle(
                    color: transactionTypeText[2],
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  destinationUser,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
