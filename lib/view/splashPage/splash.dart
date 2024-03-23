import 'package:flutter/material.dart';
import 'package:todo_list/view/components/image.dart';
import 'package:todo_list/view/components/text_h1.dart';
import 'package:todo_list/view/components/text_h2.dart';
import 'package:todo_list/view/homePage/home.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final Uri _url = Uri.parse("https://policies.google.com/terms");
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
          const SizedBox(height: 15),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextH2(
                  "La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad")),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => {_launchUrl()},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Términos y Condiciones",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue, // Establecer el color azul
                  
                ),
              ),
            ),
          ),
          const SizedBox(height: 21),
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
