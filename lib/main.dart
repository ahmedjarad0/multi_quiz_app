import 'package:flutter/material.dart';
import 'package:multi_quiz/pages/home_screen.dart';
import 'package:multi_quiz/pages/levels/level1.dart';
import 'package:multi_quiz/pages/multiple_q_screen.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)=>const  HomeScreen(),
        '/level_description' : (context)=> const Level1(),
        '/multiple_q' : (context)=> const MultiQScreen(),
      },

    );
  }
}
