import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Bottom Navigation'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Hello!! ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
              TextSpan(
                text: '${_currentIndex + 1}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.red
                ),
              ),
            ]
          ),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32,),
            title: const Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline, size: 32,),
            title: const Text('Timeline')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 32,),
            title: const Text('Profile')
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}
