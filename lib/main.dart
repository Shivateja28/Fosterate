import 'package:flutter/material.dart';
import 'package:fosterateapp/components/card.dart';
import 'components/home.dart';
import 'components/myaccount.dart';
import 'components/editprofile.dart';
import 'components/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      routes: {
        '/': (context) => home(),
        '/home': (context) => home(),
        '/myaccount': (context) => myaccount(),
        '/card': (context) => Carddata(),
        '/profile': (context) => profile()
      },
    ));
  }
}
