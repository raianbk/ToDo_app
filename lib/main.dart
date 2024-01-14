import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/pages/home_page.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');

  runApp(MaterialApp(
    title: 'My App',
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.grey, primaryColor: Colors.grey),
    debugShowCheckedModeBanner: false,
  ));
}
