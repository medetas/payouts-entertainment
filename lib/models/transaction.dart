import 'package:flutter/material.dart';

enum TransactionType {
  Withdrawal,
  Transfer,
  Bonus,
  Refund,
  Proceeds,
}

class Transaction {
  final String id;
  final String date;
  final int amount;
  final String destinationUser;
  final TransactionType transactionType;

  const Transaction({
    @required this.id,
    @required this.date,
    @required this.amount,
    @required this.destinationUser,
    @required this.transactionType,
  });
}
