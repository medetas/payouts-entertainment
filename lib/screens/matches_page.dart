import 'package:flutter/material.dart';
import 'package:payouts/dummy_data.dart';
import 'package:payouts/widgets/button_accept.dart';

class MatchesPage extends StatelessWidget {
  void userProfile(BuildContext ctx) {
    // Navigator.of(ctx).push(CupertinoPageRoute(
    //     builder: (context) => SendPage(id, title, imageUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Лучшая связь',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            textColor: Theme.of(context).primaryColor,
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      (index - 1) % 3 != 0 ? SizedBox(height: 35) : SizedBox(),
                      InkWell(
                        onTap: () {},
                        customBorder: CircleBorder(),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(DUMMY_MATCHES[index].imageUrl),
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: DUMMY_MATCHES.length,
            ),
          ),
          ButtonAccept(
            disable: false,
            buttonLabel: 'Все категории',
            makeTransaction: () {},
            marginVert: 5,
          ),
        ],
      ),
    );
  }
}
