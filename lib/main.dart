import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/data/models/awardsection/award_data.dart';
import 'package:glowing_ice_studio/view/screens/my_homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 👈 This line disables the debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial design 

        useMaterial3: true, // ✅ Enable Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider<AwardsData>(
        create: (BuildContext context) => AwardsData(),
        builder: (BuildContext context, Widget? child) {
          return  MyHomePage(title: 'Flutter Demo Home Page');},),
      
      ); 
    
  }
}