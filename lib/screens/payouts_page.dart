import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payouts/dummy_data.dart';
import 'package:payouts/models/transaction.dart';
import 'package:payouts/widgets/operation_card.dart';
import 'package:payouts/widgets/transaction_card.dart';
import 'package:payouts/widgets/user_card.dart';

class PayoutsPage extends StatelessWidget {
  void emptyFunc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: Icon(Icons.arrow_back_ios_rounded),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text(
          'Баланс',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.center,
            child: Text(
              '2 519 ₽',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: emptyFunc,
            icon: SvgPicture.asset('assets/images/help.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 10),
            // margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
              itemCount: DUMMY_OPERATIONS.length + DUMMY_USERS.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: index < DUMMY_OPERATIONS.length
                      ? OperationCard(
                          DUMMY_OPERATIONS[index].id,
                          DUMMY_OPERATIONS[index].title,
                          DUMMY_OPERATIONS[index].icon)
                      : UserCard(
                          id: DUMMY_USERS[index - DUMMY_OPERATIONS.length].id,
                          title: DUMMY_USERS[index - DUMMY_OPERATIONS.length]
                              .title,
                          imageUrl: DUMMY_USERS[index - DUMMY_OPERATIONS.length]
                              .imageUrl,
                          radius: 30,
                          fontSize: 13,
                          sizedBox: 0,
                        ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DUMMY_TRANSACTIONS.length,
              itemBuilder: (ctx, index) {
                Transaction trData = DUMMY_TRANSACTIONS[index];
                return TransactionCard(
                  id: trData.id,
                  amount: trData.amount,
                  date: trData.date,
                  destinationUser: trData.destinationUser,
                  transactionType: trData.transactionType,
                  order: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
