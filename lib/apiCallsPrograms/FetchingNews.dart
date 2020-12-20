import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final String apiKey = "0e9c0fa5ae1c471a8677099743999f7f";
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
          return Container(
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
          );
        },
    );
  }
}


