import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CloudFireStoreApp extends StatefulWidget {


  @override
  _CloudFireStoreAppState createState() => _CloudFireStoreAppState();
}

class _CloudFireStoreAppState extends State<CloudFireStoreApp> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Color charcoal = Color(0xFF264653);
  final Color persianGreen = Color(0xFF2A9D8F);
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();
  final urlController = TextEditingController();

  Future<dynamic> getVideoList() async {
    _firestore.collection("Videos").snapshots();
    return null;
  }

  addNewVideo({ String name, String url }) {
    String videoId = url.split("/").last;
    String urlToImage = "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
    print(urlToImage);
    _firestore.collection("Videos").add({
      'name': name,
      'url': url,
      'urlToImage': urlToImage,
      'createdOn': DateTime.now()
    });
    nameController.clear();
    urlController.clear();
    Navigator.pop(context);
  }

  gridView(videoList) {
    List videos = videoList.docs.map((e) => e.data()).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.2
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(videos[index]['urlToImage']),
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                        BlendMode.dstATop),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          videos[index]['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${DateFormat.yMMMd().format(videos[index]['createdOn'].toDate())}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: charcoal,
      body: StreamBuilder(
        stream: _firestore.collection("Videos").orderBy("createdOn", descending: true).snapshots(),
        builder: (context, snapshot) =>
          snapshot.hasError ? Center(child: Text('Something Went Wrong')) :
          snapshot.hasData ? gridView(snapshot.data) :
            Center(child: new CircularProgressIndicator(),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, size: 30, color: charcoal,),
        elevation: 10,
        onPressed: () {
          showDialog(
            context: scaffoldKey.currentContext,
            builder: (context) => AlertDialog(
              title: Text('Add New Youtube Video'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    controller: urlController,
                    decoration: InputDecoration(
                      labelText: 'Video URL',
                    ),
                  )
                ],
              ),
              actions: [
                RaisedButton(
                  onPressed: () {
                    addNewVideo(name: nameController.text, url: urlController.text);
                  },
                  child: Text('Submit'),
                  color: persianGreen,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
