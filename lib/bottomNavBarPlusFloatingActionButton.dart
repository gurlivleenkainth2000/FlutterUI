import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomFloatNavBarScreen extends StatefulWidget {
  @override
  _BottomFloatNavBarScreenState createState() => _BottomFloatNavBarScreenState();
}

class _BottomFloatNavBarScreenState extends State<BottomFloatNavBarScreen> {

  int _currentIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _sheetOpen = false;

  List<Widget> _screensArray = <Widget>[
    Center(child: Text('Success'),),
    HomeScreen(),
    Center(child: Text('Approvals'),),
    Center(child: Text('More'),),
  ];
  List<String> _titles = <String>["Services", "Home", "Approvals", "More"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () { },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "assets/user1.jpg",
                      width: 44,
                      height: 44,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text(
                _titles[_currentIndex],
                style: GoogleFonts.openSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, size: 32, color: Colors.black),
              onPressed: () { },
            ),
            IconButton(
              icon: Icon(Icons.notifications, size: 32, color: Colors.black),
              onPressed: () { },
            ),
          ],
          elevation: 0,
        ),
        body: _screensArray[_currentIndex],
        backgroundColor: Colors.white,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            backgroundColor: Colors.pink,
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
          color: Colors.black,
          elevation: 0.5,
          notchMargin: 8,
          // clipBehavior: Clip.antiAlias,
          child: Container(
            height: 70,
            margin: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.miscellaneous_services,
                            size: 32,
                            color: _currentIndex == 0 ? Colors.amber : Colors.white,
                          ),
                          Text(
                            'Services',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: _currentIndex == 0 ? Colors.amber : Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                              Icons.home,
                            size: 32,
                            color: _currentIndex == 1 ? Colors.amber : Colors.white,
                          ),
                          Text(
                            'Home',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: _currentIndex == 1 ? Colors.amber : Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 50,),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 32,
                            color: _currentIndex == 2 ? Colors.amber : Colors.white,
                          ),
                          Text(
                            'Approvals',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: _currentIndex == 2 ? Colors.amber : Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.more_horiz_outlined,
                            size: 32,
                            color: _currentIndex == 3 ? Colors.amber : Colors.white,
                          ),
                          Text(
                            'More',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: _currentIndex == 3 ? Colors.amber : Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
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
                          color: Color(0xFFFF0000),
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Home'),),
    );
  }
}
