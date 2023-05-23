import 'package:flutter/material.dart';
import 'package:tugasakhir/homepage.dart';
import 'package:tugasakhir/login.dart';
import 'package:tugasakhir/navbar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user.dart';

String boxUser='userbox';
String Username = '';
void main() async{
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(boxUser);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dota 2 ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
       // home: HomePage(),
    );
  }
}

