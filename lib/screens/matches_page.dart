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
              'Лучший User 🎩',
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
                  margin: EdgeInsets.symmetric(
                      vertical: (index - 1) % 3 != 0 ? 5 : 0),
                  child: Column(
                    mainAxisAlignment: (index - 1) % 3 != 0
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            onTap: () {},
                            customBorder: CircleBorder(),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(DUMMY_MATCHES[index].imageUrl),
                              radius: 55,
                              child: Container(
                                decoration: index < 3
                                    ? BoxDecoration(
                                        border: Border.all(
                                            width: 3,
                                            color:
                                                Theme.of(context).primaryColor),
                                        shape: BoxShape.circle,
                                      )
                                    : BoxDecoration(),
                              ),
                            ),
                          ),
                          DUMMY_MATCHES[index].online
                              ? Positioned(
                                  bottom: -8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 5,
                                          color: Theme.of(context).canvasColor),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
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
