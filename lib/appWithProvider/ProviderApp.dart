import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter += 1;
    notifyListeners();
  }
}

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'ProviderApp',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Provider Implementation"),
            Consumer<Counter>(
              builder: (context, value, child) {
                return Text("${value.counter}");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counterObj = context.read<Counter>();
          Timer.periodic(Duration(seconds: 1), (timer) => counterObj.increment());
          // counterObj.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

