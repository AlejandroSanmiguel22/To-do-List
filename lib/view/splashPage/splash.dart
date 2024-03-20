import 'package:flutter/material.dart';
import 'package:todo_list/view/components/image.dart';
import 'package:todo_list/view/components/text_h1.dart';
import 'package:todo_list/view/components/text_h2.dart';
import 'package:todo_list/view/components/text_h3.dart';
import 'package:todo_list/view/homePage/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Imag("assets/images/shape.png", 181, 165),
            ],
          ),
          const SizedBox(height: 79),
          const Imag('assets/images/onboarding-image.png', 180, 168),
          const SizedBox(height: 70),
          const TextH1("Lista de Tareas"),
          const SizedBox(height: 21),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextH2(
                  "La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad")),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color.fromRGBO(129, 220, 226, 0.986),
              ),
            ),
            child: const Text('Siguiente',
                style: TextStyle(fontWeight: FontWeight.w900)),
          )
        ],
      ),
    ));
  }
}
