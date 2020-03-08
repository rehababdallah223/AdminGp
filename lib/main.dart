
import 'package:admin_test/screens/admin-home-screen.dart';
import 'package:flutter/material.dart';
void main ()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',

      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.blueAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',

      ),



      home: AdminHomeScreen(),);
  }
}
