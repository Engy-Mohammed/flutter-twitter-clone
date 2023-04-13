import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({ Key? key }) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        useMaterial3:true,
        
      ),
      
       
    );
  }
}