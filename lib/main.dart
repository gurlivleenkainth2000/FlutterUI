import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_snippets/UI Practices/bottomNavBar.dart';             // bottom navigation with bottomNavigationBard
import 'package:flutter_ui_snippets/UI Practices/bottomNavigation.dart';         // bottom navigation with defaultTabController
import 'package:flutter_ui_snippets/UI Practices/customTabBar.dart';             // appBar bottom navigation
import 'package:flutter_ui_snippets/UI Practices/bottomAppbarFAB.dart';          // bottom navigation bar with floating action button in center
import 'package:flutter_ui_snippets/apiCallsPrograms/FetchingNews.dart';
import 'package:flutter_ui_snippets/apiCallsPrograms/fetchingRestaurants.dart';
import 'package:flutter_ui_snippets/practiceCodes/fetchingLocation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // primaryColor: Colors.amber,
        // brightness: Brightness.dark,
        // canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
          subtitle1: GoogleFonts.openSans(
            fontSize: 18.0,
            color: Colors.grey[700]
          )
        )
      ),
      home: UserAddressPage(),
    );
  }
}