import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrientationPage extends StatefulWidget {
  @override
  _OrientationPageState createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {
  bool isLargeScreen = false;
  var selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Example'),
      ),
      backgroundColor: Colors.grey[400],
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          isLargeScreen = true;
          // setState(() {});
        } else {
          isLargeScreen = false;
          // setState(() {});
        }
        return Row(
          children: [
            Expanded(
              child: ListView.builder(
                // padding: EdgeInsets.all(16),
                itemCount: 20,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    if (isLargeScreen) {
                      selectedValue = index + 1;
                      setState(() {});
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailWidget(index + 1),
                      ));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
            )),
            isLargeScreen
                ? Expanded(child: DetailWidget(selectedValue))
                : Container(),
          ],
        );
      }),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      // ),
      body: Container(
        color: Colors.teal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.data.toString(),
                textScaleFactor: 6,
                style: TextStyle(fontSize: 36.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
