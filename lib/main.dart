import 'package:yoven/login.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        routes: {
          '/login' : (BuildContext context) => const Login2Screen() ,
        },
        initialRoute: '/login',
        
      );
  }
}
