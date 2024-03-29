import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/repository/task_repository.dart';
import 'package:todo_list/view/components/image.dart';
import 'package:todo_list/view/components/text_h1.dart';
import 'package:todo_list/view/components/text_h3.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TaskRepository taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: taskRepository.getTasks(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No hay tareas"),
                  );
                }
                return _TaskList(
                  snapshot.data!,
                  onTaskDoneChange: (task) {
                    task.done = !task.done;
                    taskRepository.saveTasks(snapshot.data!);
                    setState(() {});
                  },
                  onDelete: (task) {
                    setState(() {
                      snapshot.data!.remove(task);
                      taskRepository.saveTasks(snapshot.data!);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add, size: 35),
      ),
     /*  bottomSheet: const Text(
            'Hecho por: Alejandro Sanmiguel',
            style: TextStyle(
              color:  Colors.grey, // Color de texto suave
              fontSize: 12,
              fontStyle: FontStyle.italic, // Estilo de texto en cursiva
            ),
            textAlign: TextAlign.start,
          ), 
      */
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(
        onTaskCreated: (Task task) {
          taskRepository.addTask(task);
          setState(() {});
        },
      ),
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final void Function(Task task) onTaskCreated;

  _NewTaskModal({Key? key, required this.onTaskCreated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
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
                hintText: "Nombre de la tarea",
              ),
            ),
            const SizedBox(height: 26),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(306, 54),
                  backgroundColor: const Color(0xFF40B7AD),
                ),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
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
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  // ignore: unused_element
  const _TaskList(this.taskList,
      {required this.onTaskDoneChange, required this.onDelete});

  final List<Task> taskList;
  final void Function(Task task) onTaskDoneChange;
  final void Function(Task task) onDelete;

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
            child: ListView.builder(
              itemBuilder: (context, index) => _TaskItem(taskList[index],
                  onTap: () => onTaskDoneChange(taskList[index]),
                  onDelete: () => onDelete(taskList[index])),
              itemCount: taskList.length,
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
  const _TaskItem(this.task, {Key? key, this.onTap, this.onDelete});

  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // GestureDetector solo para el icono del checkbox
            GestureDetector(
              onTap: onTap,
              child: Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: const Color(0xFF40B7AD),
              ),
            ),
            const SizedBox(width: 10),
            // Texto de la tarea
            Expanded(
              child: TextH3(
                task.title,
              ),
            ),
            // Icono de cierre
            GestureDetector(
              onTap: onDelete,
              child: const Icon(
                Icons.close,
                color: Color(0xFF40B7AD), // Color del icono
              ),
            ),
          ],
        ),
      ),
    );
  }
}
