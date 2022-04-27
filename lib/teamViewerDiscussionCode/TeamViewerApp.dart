import 'package:flutter/material.dart';

class MyTeamViewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamViewer App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple.shade600
      ),
      home: SplashPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Manjot Singh"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                    "assets/user1.jpg",
                )
            ),
            Text(
              'Home',
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w700,
                  color: Colors.red
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage(),)
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Splash',
          style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              color: Colors.yellow
          ),
        ),
      ),
    );;
  }
}

