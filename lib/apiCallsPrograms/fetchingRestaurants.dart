import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

String apiKey = "c168f18054c9a54597566ac8c180cce5";
List<String> cities = <String>[
  "Khanna",
  "Ludhiana",
  "Delhi",
  "Kolkata",
  "Ambala"
];

Future<String> fetchCuisines({ int cityId = 20}) async {
  http.Client client = new http.Client();
  final String url = "https://developers.zomato.com/api/v2.1/cuisines?city_id=$cityId";
  final response = await client.get(url, headers: {
    'user-key': apiKey
  });
  print(">>> Cuisines: " + response.body);
  return null;
}

Future fetchRestaurants({ int cityId = 20}) async {
  http.Client client = new http.Client();
  final String url = "https://developers.zomato.com/api/v2.1/search?entity_id=$cityId&entity_type=city";
  final response = await client.get(url, headers: {
    'user-key': apiKey
  });
  print(">>> Restaurants: " + response.body);
  return null;
}

class RestaurantListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Restaurants',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: FutureBuilder(
        future: fetchRestaurants(),
        builder: (context, snapshot) => Center(child: Text('Welcome'),),
      ),
    );
  }
}
