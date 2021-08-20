import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<String> items = new List<String>.generate(30, (i) => "Items ${i+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe To Dismiss"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,int index){
            return Dismissible(
                key: Key(items[index]),
              onDismissed: (direction){
                  setState(() {
                    items.removeAt(index);
                  }); // Using setState so that ListView gets rebuild and avoid Range Error.
                  Scaffold.of(context).showSnackBar(new SnackBar(
                      content: Text("ITEM IS SUCCESSFULLY REMOVED")));
              },
              background: Container(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
              ),
              child: ListTile(
                title: Text("${items[index]}"),
              ),

                );
          }),
    );
  }
}
