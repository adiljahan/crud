import 'package:crud/Home_page.dart';
import 'package:crud/Login_signup.dart';
import 'package:crud/Sign_up.dart';
import 'package:crud/Splash.dart';
import 'package:crud/task_page1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'liverpod.dart';
var w;
var h;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



///hjgjjj


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;


    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
debugShowCheckedModeBanner: false,

    );
  }
}
