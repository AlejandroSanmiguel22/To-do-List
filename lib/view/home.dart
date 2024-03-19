import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 141,
        toolbarHeight: 129,
        leading: Row(
          children: [
            Image.asset(
              'assets/images/shape.png',
              width: 141,
              height: 129,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF40B7AD),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFF40B7AD),
              alignment: Alignment.center,
              constraints: const BoxConstraints.tightForFinite(width: 420, height: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),
                  Image.asset(
                    'assets/images/tasks-list-image.png',
                    width: 141,
                    height: 129,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Completa tus tareas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
