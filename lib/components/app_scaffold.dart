import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget home;
  AppScaffold({@required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
