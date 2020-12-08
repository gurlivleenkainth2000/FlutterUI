import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_snippets/bottomNavBar.dart';                           // bottom navigation with bottomNavigationBar
import 'package:flutter_ui_snippets/bottomNavigation.dart';                       // bottom navigation with defaultTabController
import 'package:flutter_ui_snippets/customTabBar.dart';                           // appBar bottom navigation
import 'package:flutter_ui_snippets/bottomNavBarPlusFloatingActionButton.dart';   // bottom navigation bar with floating action button in center

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
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomFloatNavBarScreen(),
    );
  }
}