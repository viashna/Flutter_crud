
import 'package:task/login.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InventoryApp',
      theme: ThemeData(
        
        primarySwatch: Colors.teal
      ),
      home: LoginPage(),
       
    );
  }
}

