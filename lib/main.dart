
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'mainpage.dart';

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: const MainPage(),
  ));
}
