import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payouts/screens/send_page.dart';

class UserCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double radius;
  final double fontSize;
  final double sizedBox;

  UserCard({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    this.radius = 50,
    this.fontSize = 15,
    this.sizedBox = 10,
  });

  void destinationUserPressed(BuildContext ctx) {
    Navigator.of(ctx).push(CupertinoPageRoute(
        builder: (context) => SendPage(id, title, imageUrl, 'Отправить')));
  }

  void userProfile(BuildContext ctx) {
    // Navigator.of(ctx).push(CupertinoPageRoute(
    //     builder: (context) => SendPage(id, title, imageUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: sizedBox),
        RawMaterialButton(
          elevation: 0,
          onPressed: () => sizedBox == 0
              ? destinationUserPressed(context)
              : userProfile(context),
          fillColor: Colors.white,
          highlightElevation: 0,
          child: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: radius,
          ),
          shape: CircleBorder(),
        ),
        SizedBox(height: sizedBox),
        Container(
          child: AutoSizeText(
            sizedBox == 0 ? title.substring(1) : title,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
