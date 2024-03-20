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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(),
          Expanded(child: _TaskList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(
        onTaskCreated: (Task task) {
          print(task.title);
        },
      ),
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  // ignore: unused_element
  _NewTaskModal({super.key, required this.onTaskCreated});

  final _controller = TextEditingController();
  final void Function(Task task) onTaskCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 33,
        vertical: 23,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextH1("Nueva Tarea"),
          const SizedBox(height: 26),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "Nombre de la tarea"),
          ),
          const SizedBox(height: 26),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(306, 54),
                  backgroundColor: const Color(0xFF40B7AD)),
              onPressed: () {
                if (_controller.text.isEmpty) {
                  final task = Task(_controller.text);
                  onTaskCreated(task);
                  Navigator.of(context).pop();
                }
              },
              child: const TextH1('Guardar', color: Color(0xF7FFFFFF)),
            ),
          )
        ],
      ),
    );
  }
}

class _TaskList extends StatefulWidget {
  // ignore: unused_element
  const _TaskList({super.key});
  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final tacksList = <Task>[
    Task("Sacar a los perros"),
    Task("Estudiar para el examen"),
    Task("Sacar la basura"),
    Task("Hacer ejercicio"),
    Task("Sacar la basura"),
    Task("Hacer ejercicio"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextH1('Tareas'),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => _TaskItem(
                tacksList[index],
                onTap: () {
                  tacksList[index].done = !tacksList[index].done;
                  setState(() {});
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemCount: tacksList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF40B7AD),
      child: const Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(children: [Imag("assets/images/shape.png", 181, 169)]),
          Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Imag('assets/images/tasks-list-image.png', 120, 120),
              SizedBox(
                height: 90,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child:
                      TextH1('Completa tus tareas', color: Color(0xF7FFFFFF)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  // ignore: unused_element
  const _TaskItem(this.task, {super.key, this.onTap});

  final Task task;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                  task.done
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank,
                  color: const Color(0xFF40B7AD)),
              const SizedBox(width: 10),
              TextH3(task.title)
            ],
          ),
        ),
      ),
    );
  }
}
