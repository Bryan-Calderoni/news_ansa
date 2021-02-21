import 'package:flutter/material.dart';

import 'package:fudeo_test_ansa/components/app_scaffold.dart';
import 'package:fudeo_test_ansa/pages/home.dart';
void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      home: HomePage(),
    );
  }
}





