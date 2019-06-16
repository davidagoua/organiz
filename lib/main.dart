import 'package:flutter/material.dart';
import 'ClientDetails.dart';
import 'HomeView.dart';
import 'UserList.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginView(),
        '/home': (BuildContext context) => HomeView(),
        '/details': (BuildContext context) => ClientDetails(),
        '/list': (BuildContext context) => UserList(),
      },
    );
  }
}

