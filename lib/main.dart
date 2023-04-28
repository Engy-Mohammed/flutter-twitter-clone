import 'package:flutter/material.dart';
import 'package:twitter_clone/views/pages/editProfile.dart';
import 'package:twitter_clone/views/pages/homepage.dart';
import 'package:twitter_clone/views/pages/newTwitte.dart';

import 'package:twitter_clone/views/pages/uploadImage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   useMaterial3:true,
      // ),
      debugShowCheckedModeBanner: false,
      
      home: Homepage(),
    //  home:UploadVideo(),
    );
  }
}
