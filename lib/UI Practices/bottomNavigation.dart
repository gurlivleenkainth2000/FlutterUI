import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, 
        child: Scaffold(
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
              Center(
                  child: Text(
                    "Timeline",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
              Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
          bottomNavigationBar: TabBar(
            labelPadding: EdgeInsets.only(left: 5, right: 5),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicator: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black, width: 4)
              ),
            ),
            tabs: [
              Container(
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16,
                    
                  ),
                ),
              ),
              Container(
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                child: Text(
                  "TimeLine",
                  style: TextStyle(
                    fontSize: 16,
                    
                  ),
                ),
              ),
              Container(
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 16,
                    
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
