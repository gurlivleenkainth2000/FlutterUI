import 'package:flutter/material.dart';

class RandomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random App',
      theme: ThemeData(
        // primarySwatch: Colors.teal,
        primaryColor: Color(0xFFE91E63),
        primaryColorDark: Color(0xFFC2185B),
        primaryColorLight: Color(0xFFF8BBD0),
        accentColor: Color(0xFFFFC107),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        dividerColor: Color(0xFFBDBDBD),
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF212121)),
          bodyText2: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/drawer.png", color: Colors.white, fit: BoxFit.contain),
          ),
        ),
        title: Text('Random App'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Material Testing'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: null
            )
          ],
        ),
      ),
    );
  }
}
