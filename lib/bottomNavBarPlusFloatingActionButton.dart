import 'package:flutter/material.dart';

class BottomFloatNavBarScreen extends StatefulWidget {
  @override
  _BottomFloatNavBarScreenState createState() => _BottomFloatNavBarScreenState();
}

class _BottomFloatNavBarScreenState extends State<BottomFloatNavBarScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Bottom Navigation'),
          elevation: 0.5,
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
                          color: Colors.amber
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
        floatingActionButton: FloatingActionButton(
          // shape: ,
          elevation: 0,
          onPressed: () { },
          child: Icon(Icons.add, size: 32,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xFF4e4e4e),
          elevation: 0.5,
          notchMargin: 8,
          // clipBehavior: Clip.antiAlias,
          child: Container(
            height: 60,
            margin: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    tooltip: 'Home',
                    iconSize: 32,
                    color: _currentIndex == 0 ? Colors.amber : Colors.white,
                    icon: Icon(Icons.home),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    tooltip: 'Timeline',
                    iconSize: 32,
                    color: _currentIndex == 1 ? Colors.amber : Colors.white,
                    icon: Icon(Icons.timeline),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                  ),
                  SizedBox(width: 50,),
                  IconButton(
                    tooltip: 'Notification',
                    iconSize: 32,
                    color: _currentIndex == 2 ? Colors.amber : Colors.white,
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                  ),
                  IconButton(
                    tooltip: 'Profile',
                    iconSize: 32,
                    color: _currentIndex == 3 ? Colors.amber : Colors.white,
                    icon: Icon(Icons.account_circle_rounded),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                  ),
                ],
              )
          ),
          // child: SizedBox(
          //   width: double.infinity,
          //   height: 60,
          // ),
        )
    );
  }
}

/*
child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Home',
                icon: Icon(Icons.home, size: 32,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                tooltip: 'Timeline',
                icon: Icon(Icons.timeline, size: 32,),
                onPressed: () {
                  _currentIndex = 1;
                },
              ),
              IconButton(
                tooltip: 'Notification',
                icon: Icon(Icons.notifications, size: 32,),
                onPressed: () {
                  _currentIndex = 2;
                },
              ),
              IconButton(
                tooltip: 'Profile',
                icon: Icon(Icons.account_circle_rounded, size: 32,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          )
BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 32,),
                  title: const Text('Home')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.timeline, size: 32,),
                  title: const Text('Timeline')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, size: 32,),
                  title: const Text('Notification')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded, size: 32,),
                  title: const Text('Profile')
              ),
 */