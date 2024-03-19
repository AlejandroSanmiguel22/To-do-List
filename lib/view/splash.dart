import 'package:flutter/material.dart';
import 'package:todo_list/view/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/shape.png',
                width: 141,
                height: 129,
              ),
            ],
          ),
          const SizedBox(height: 79),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 200,
          ),
          const SizedBox(height: 70),
          const Text(
            "Lista de Tareas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 21),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
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
                    Color.fromRGBO(129, 220, 226, 0.986))),
            child: const Text('Siguiente',
                style: TextStyle(fontWeight: FontWeight.w900)),
          )
        ],
      ),
    ));
  }
}
