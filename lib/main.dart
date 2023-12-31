import 'package:flutter/material.dart';
import 'package:moniepoint_task/views/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monie point',
      theme: ThemeData(
       
        primarySwatch: Colors.deepPurple,
      ),
      home: const DashboardView(),
     
    );
  }
}
