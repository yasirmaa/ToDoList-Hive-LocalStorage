import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/home_page.dart';

void main() async{

  // init hive
  await Hive.initFlutter();
  
  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoList',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.yellow
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

