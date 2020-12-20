import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class NewsObject {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String published;

  NewsObject({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.published,
  });

  factory NewsObject.fromJson(Map<String, dynamic> json) {
    return NewsObject(
        author: json["author"] == null ? "-" : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        content: json['content'],
        urlToImage: json["urlToImage"] == null ? "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png" : json["urlToImage"] ,
        published: json["publishedAt"]);
  }

}

Future<List<NewsObject>> fetchNews() async {
  http.Client client = new http.Client();
  final String apiKey = "0e9c0fa5ae1c471a8677099743999f7f";  // add your appKey
  final newsUrl = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-20&sortBy=publishedAt&pageSize=100&apiKey=$apiKey";
  final response = await client.get(newsUrl);
  return compute(parseNews, response.body);
}

List<NewsObject> parseNews(String response) {
  Map<String, dynamic> jsonDate = jsonDecode(response);
  List news = jsonDate['articles'];
  return news.map((json) => NewsObject.fromJson(json)).toList();
}

class NewsListApp extends StatefulWidget {
  @override
  _NewsListAppState createState() => _NewsListAppState();
}

class _NewsListAppState extends State<NewsListApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "News",
          style:
              GoogleFonts.openSans(fontSize: 24.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) => snapshot.hasError
              ? Center(
                  child: Text("Some Error Occurs: \n ${snapshot.error}"),
                )
              : snapshot.hasData
                  ? NewsGridView(newsList: snapshot.data,)
                  : Center(
                      child: new CircularProgressIndicator(),
                    )),
    );
  }
}

class NewsListView extends StatelessWidget {

  final List<NewsObject> newsList;
  NewsListView({Key key, @required this.newsList}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              // borderRadius: BorderRadius.circular(25),
              child: Image.network(
                newsList[index].urlToImage,
                fit: BoxFit.fill,
                height: 64,
                width: 64,
              ),
            ),
            title: Text(
              newsList[index].title,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              newsList[index].author,
              style: Theme.of(context).textTheme.subtitle1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.keyboard_arrow_right,size: 24,),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey,
            height: 2.0,
          );
        },
    );
  }
}

class NewsGridView extends StatelessWidget {

  final List<NewsObject> newsList;
  NewsGridView({@required this.newsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 2/3
        ),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              MaterialPageRoute route = new MaterialPageRoute(
                builder: (context) => NewsFullDetail(newsObject: newsList[index]),
              );
              Navigator.of(context).push(route);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)
                    ),
                    child: Image.network(
                      newsList[index].urlToImage,
                      loadingBuilder: (context, child, loadingProgress) {
                        if(loadingProgress == null) {
                          return child;
                        }
                        return Container(
                          height: 180,
                          child: Center(
                            child: new CircularProgressIndicator(),
                          ),
                        );
                      },
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      newsList[index].title,
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      newsList[index].author,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 0,
                        bottom: 0
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}

class NewsFullDetail extends StatefulWidget {

  final NewsObject newsObject;
  NewsFullDetail({@required this.newsObject});

  @override
  _NewsFullDetailState createState() => _NewsFullDetailState();
}

class _NewsFullDetailState extends State<NewsFullDetail> {
  bool _newLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(200, 70),
                    bottomLeft: Radius.elliptical(200, 70),
                  ),
                  child: Image.network(
                    widget.newsObject.urlToImage,
                    loadingBuilder: (context, child, loadingProgress) {
                      if(loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        child: Center(
                          child: new CircularProgressIndicator(),
                        ),
                      );
                    },
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 350,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart, size: 30, color: Colors.white,),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  height: 64,
                    // width: 64,
                    bottom: -30,
                    left: 0,
                    right: 0,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _newLiked = !_newLiked;
                        });
                      },
                      child: Icon(
                        _newLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,size: 32, color: Color(0xFFFF0000),),
                    )
                ),
              ],
            ),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.newsObject.title,
                    style: GoogleFonts.openSans(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Author:  ',
                            style: GoogleFonts.openSans(fontSize: 18.0, color: Colors.grey[600])
                        ),
                        TextSpan(
                            text: widget.newsObject.author,
                            style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800])
                        ),
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Published on:  ',
                            style: GoogleFonts.openSans(fontSize: 18.0, color: Colors.grey[600])
                        ),
                        TextSpan(
                            text: widget.newsObject.published,
                            style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]
                            )
                        ),
                      ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Description: \n',
                            style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                color: Colors.grey[600],
                            )
                        ),
                        TextSpan(
                            text: widget.newsObject.description,
                            style: GoogleFonts.openSans(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]
                            )
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Read More",
                      style: GoogleFonts.openSans(
                        fontSize: 32.0,
                        color: Color(0xFFFF0000),
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

