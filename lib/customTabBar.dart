import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTabs extends StatefulWidget {
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Custom Tabs"),
          bottom: TabBar(
            labelPadding: EdgeInsets.only(left: 5, right: 5),
            isScrollable: true,
            // unselectedLabelColor: Colors.white,
            // labelColor: Colors.yellow,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.orange, width: 4)
              ),
            ),
            tabs: <Widget>[
              Container(
//                width: MediaQuery.of(context).size.width,
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     border: Border.all(color: Colors.yellow, width: 1)),
                child: Text(
                  "Trending",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DaysOne",
                  ),
                ),
              ),
              Container(
//                width: MediaQuery.of(context).size.width,
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     border: Border.all(color: Colors.yellow, width: 1)),
                child: Text(
                  "Veg Food",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DaysOne",
                  ),
                ),
              ),
              Container(
//                width: MediaQuery.of(context).size.width,
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     border: Border.all(color: Colors.yellow, width: 1)),
                child: Text(
                  "Non-Veg Food",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DaysOne",
                  ),
                ),
              ),
              Container(
//                width: MediaQuery.of(context).size.width,
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     border: Border.all(color: Colors.yellow, width: 1)),
                child: Text(
                  "Snacks",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DaysOne",
                  ),
                ),
              ),
              Container(
//                width: MediaQuery.of(context).size.width,
                height: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //     border: Border.all(color: Colors.yellow, width: 1)),
                child: Text(
                  "Deserts",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DaysOne",
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: ScrollPhysics(),
          children: <Widget>[
            trendingNews(),
            Center(
                child: Text(
              "Veg Food",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "DaysOne",
              ),
            )),
            Center(
                child: Text(
              "Non-Veg Food",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "DaysOne",
              ),
            )),
            Center(
                child: Text(
              "Snacks",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "DaysOne",
              ),
            )),
            Center(
                child: Text(
              "Desert",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "DaysOne",
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget trendingNews() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Container 1', style: TextStyle(fontSize: 32),),
                      Icon(Icons.arrow_forward, size: 32,)
                    ],
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 15,),
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Container 2', style: TextStyle(fontSize: 32),),
                      Icon(Icons.arrow_forward, size: 32,)
                    ],
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
          ),
          GridView.builder(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3/4
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // width: 100,
                  // height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellow
                  ),
                ),
              );
            },
          )
          // Container(
          //     // width: 150,
          //     height: 500,
          //     child: ListView.builder(
          //       // shrinkWrap: true,
          //       // scrollDirection: Axis.horizontal,
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             width: 100,
          //             height: 250,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15),
          //                 color: Colors.yellow
          //             ),
          //           ),
          //         );
          //       },
          //     )
          // ),
        ],
      ),
    );
  }
}
