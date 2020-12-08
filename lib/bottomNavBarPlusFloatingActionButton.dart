import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomFloatNavBarScreen extends StatefulWidget {
  @override
  _BottomFloatNavBarScreenState createState() => _BottomFloatNavBarScreenState();
}

class _BottomFloatNavBarScreenState extends State<BottomFloatNavBarScreen> {

  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _sheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            child: Icon(Icons.add, size: 32,),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        // floatingActionButton: Builder(
        //   builder: (context) => _sheetOpen ? SizedBox() : FloatingActionButton(
        //     onPressed: () {
        //       // _showModalBottomSheet();
        //       setState(() {
        //         _sheetOpen = !_sheetOpen;
        //       });
        //       _showBottomSheet(context);
        //     },
        //     child: Icon(Icons.add, size: 32,),
        //     clipBehavior: Clip.hardEdge,
        //   ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white38,
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
                    color: _currentIndex == 0 ? Colors.red : Colors.black,
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
                    color: _currentIndex == 1 ? Colors.red : Colors.black,
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
                    color: _currentIndex == 2 ? Colors.red : Colors.black,
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
                    color: _currentIndex == 3 ? Colors.red : Colors.black,
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
        )
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          width: double.infinity,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          type: MaterialType.circle,
                          color: Colors.deepPurple,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(CupertinoIcons.doc, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Document', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.red,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(CupertinoIcons.camera_fill, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Camera', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          type: MaterialType.circle,
                          color: Colors.pinkAccent,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(CupertinoIcons.photo, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Gallery', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          type: MaterialType.circle,
                          color: Colors.orange,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(CupertinoIcons.double_music_note, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Audio', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.green,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(CupertinoIcons.location_north_fill, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Location', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Material(
                          type: MaterialType.circle,
                          color: Colors.green,
                          child: InkWell(
                            onTap: () { },
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(Icons.contacts, size: 32, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Contacts', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF4e4e4e),
          borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Material(
                  type: MaterialType.circle,
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _sheetOpen = !_sheetOpen;
                      });
                    },
                    child: SizedBox(
                      height: 56,
                      width: 56,
                      child: Icon(CupertinoIcons.search, size: 32,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Share', style: TextStyle(fontSize: 16),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Material(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _sheetOpen = !_sheetOpen;
                      });
                    },
                    child: SizedBox(
                      height: 56,
                      width: 56,
                      child: Icon(CupertinoIcons.doc, size: 32,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Documents', style: TextStyle(fontSize: 16),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Material(
                  type: MaterialType.circle,
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _sheetOpen = !_sheetOpen;
                      });
                    },
                    child: SizedBox(
                      height: 56,
                      width: 56,
                      child: Icon(Icons.contacts, size: 32),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text('Contacts', style: TextStyle(fontSize: 16),)
            ],
          ),
        ],
      ),
    ),
    );
  }
}