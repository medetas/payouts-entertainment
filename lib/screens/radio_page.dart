import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:payouts/dummy_data.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int checker = -1;

  void empty(index) {
    setState(() {
      if (checker == index) {
        checker = -1;
      } else {
        checker = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Моё настроение',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: index == checker
                ? Theme.of(context).primaryColor
                : Colors.grey[100],
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () => empty(index),
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
        },
        itemCount: DUMMY_RADIOS.length,
      ),
    );
  }
}
