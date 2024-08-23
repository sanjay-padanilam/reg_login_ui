import 'package:flutter/material.dart';

import 'package:reg_login_ui/view/registrationpage/registrationpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registrationpage(),
    );
  }
}
