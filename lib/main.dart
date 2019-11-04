import 'package:crudfirebaseflutter/src/Blocs/Provider.dart';
import 'package:crudfirebaseflutter/src/Pages/HomePage.dart';
import 'package:crudfirebaseflutter/src/Pages/LoginPage.dart';
import 'package:crudfirebaseflutter/src/Pages/ProductPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: 'home',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'product': (BuildContext context) => ProductPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );

    return Provider(
      child: materialApp,
    );
  }
}
