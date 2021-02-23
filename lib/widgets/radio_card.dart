import 'package:flutter/material.dart';

import 'package:payouts/dummy_data.dart';

class RadioCard extends StatelessWidget {
  final int index;
  final int checker;
  final Function empty;

  RadioCard(this.index, this.checker, this.empty);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color:
          index == checker ? Theme.of(context).primaryColor : Colors.grey[100],
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: empty,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Text(
                DUMMY_RADIOS[index].emoji,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text(
              DUMMY_RADIOS[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: index == checker ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
