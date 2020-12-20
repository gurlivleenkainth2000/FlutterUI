import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_snippets/UI Practices/bottomNavBar.dart';             // bottom navigation with bottomNavigationBard
import 'package:flutter_ui_snippets/UI Practices/bottomNavigation.dart';         // bottom navigation with defaultTabController
import 'package:flutter_ui_snippets/UI Practices/customTabBar.dart';             // appBar bottom navigation
import 'package:flutter_ui_snippets/UI Practices/bottomAppbarFAB.dart';   // bottom navigation bar with floating action button in center

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        // canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomAppbarFABScreen(),
    );
  }
}