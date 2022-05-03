import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Assignment 8 POPUPMENU'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaff = new GlobalKey<ScaffoldState>();
  static const _popItem = <String>["Pizza", "Burger", "Fries", "Noodles"];
  static List<PopupMenuItem<String>> _pop = _popItem
      .map((String val) => PopupMenuItem<String>(
            value: val,
            child: Text(val),
          ))
      .toList();
  late String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaff,
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(child: Text("What do you want to eat ? ", style: TextStyle(fontSize: 30, color: Colors.red))),
                PopupMenuButton(
                  onSelected: (String val) {
                    value = val;
                    _scaff.currentState?.showSnackBar(
                      SnackBar(content: Text(val)),
                    );
                  },
                  itemBuilder: (BuildContext context) => _pop,
                  icon: Icon(Icons.restaurant, size: 50,color: Colors.purple,),
                ),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
