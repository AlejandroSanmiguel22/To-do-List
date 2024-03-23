import 'package:flutter/material.dart';
import 'package:todo_list/view/splashPage/splash.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
Widget build(BuildContext context) {

  const Color primaryColor = Color(0xFF40B7AD);
  const Color textColor = Color(0xFF4A4A4A);
  const Color backgroundColor = Color(0xF7FFFFFF);

  return MaterialApp(
    title: "To do List",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: Theme.of(context).textTheme.apply(
        fontFamily: "Poppins",
        bodyColor: textColor
      )
    ),
    home: SplashPage(),
  );
}

}
