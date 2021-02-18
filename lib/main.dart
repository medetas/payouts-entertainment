import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payouts/screens/navigation_bar.dart';
import 'package:payouts/screens/payouts_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    // statusBarBrightness: Brightness.dark, //status bar brigtness
    // statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    // systemNavigationBarDividerColor:
    //     Colors.greenAccent, //Navigation bar divider color
    // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, widget) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, widget),
      //     maxWidth: 1200,
      //     minWidth: 450,
      //     defaultScale: true,
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(450, name: MOBILE),
      //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       ResponsiveBreakpoint.autoScale(1000, name: TABLET),
      //       ResponsiveBreakpoint.resize(1200, name: DESKTOP),
      //       ResponsiveBreakpoint.autoScale(2460, name: "4K"),
      //     ],
      //     background: Container(color: Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      title: 'Payouts',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Color(0xFF1152FD),
      ),
      routes: {
        '/': (ctx) => NavigationBar(),
        '/payouts': (ctx) => PayoutsPage(),
        // SendPage.routeName: (ctx) => SendPage(),
      },
      // if error happens
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => PayoutsPage(),
      ),
    );
  }
}
