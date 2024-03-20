import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/view/components/image.dart';
import 'package:todo_list/view/components/text_h1.dart';
import 'package:todo_list/view/components/text_h3.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF40B7AD),
            child: const Column(
              children: [
                Row(children: [Imag("assets/images/shape.png", 181, 169)]),
                Column(
                  children: [
                    Imag('assets/images/tasks-list-image.png', 120, 120),
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child:
                            TextH1('Completa tus tareas', color: Color(0xF7FFFFFF)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 25, top: 25),
            child: TextH1('Tareas'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemBuilder: (context, index) => _TaskItem(tacksList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: tacksList.length,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  // ignore: unused_element
  const _TaskItem(this.task, {super.key});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        child: Row(
          children: [
            const Icon(Icons.check_box_outline_blank, color:   Color(0xFF40B7AD)),
            const SizedBox(width: 10),
            TextH3(task.title)
          ],
        ),
      ),
    );
  }
}

final tacksList = <Task>[
  Task("Sacar a los perros"),
  Task("Estudiar para el examen"),
  Task("Sacar la basura"),
  Task("Hacer ejercicio"),
  Task("Sacar la basura"),
  Task("Hacer ejercicio"),
];
