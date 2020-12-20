import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///F:/Flutter%20Apps%202020/flutter_ui_snippets/lib/UI%20Practices/bottomNavBar.dart';                           // bottom navigation with bottomNavigationBar
import 'file:///F:/Flutter%20Apps%202020/flutter_ui_snippets/lib/UI%20Practices/bottomNavigation.dart';                       // bottom navigation with defaultTabController
import 'file:///F:/Flutter%20Apps%202020/flutter_ui_snippets/lib/UI%20Practices/customTabBar.dart';                           // appBar bottom navigation
import 'file:///F:/Flutter%20Apps%202020/flutter_ui_snippets/lib/UI%20Practices/bottomNavBarPlusFloatingActionButton.dart';   // bottom navigation bar with floating action button in center

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
      home: BottomFloatNavBarScreen(),
    );
  }
}