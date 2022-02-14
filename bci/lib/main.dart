import 'package:bci/telas/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BCI());
}

class BCI extends StatelessWidget {
  const BCI({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700],),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent[700],
          textTheme: ButtonTextTheme.primary,
      )),
      home: const Dashboard(),
    );
  }
}
