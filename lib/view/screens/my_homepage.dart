import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/view/widgets/top_appbar_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: const [
        TopAppBarWidget(),
        // Add remaining body content
        ]
        ),
    );
  }
}
