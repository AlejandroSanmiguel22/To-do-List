import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/task.dart';

class TaskRepository {
  Future<bool> addTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = prefs.getStringList('tasks') ?? [];
    jsonTasks.add(jsonEncode(task.toJson()));
    return prefs.setStringList('tasks', jsonTasks);
  }

  Future<bool> deleteLastTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = prefs.getStringList('tasks') ?? [];

    // Verificamos que haya al menos una tarea para eliminar
    if (jsonTasks.isNotEmpty) {
      // Eliminamos la última tarea de la lista
      jsonTasks.removeLast();
      // Actualizamos las tareas en SharedPreferences
      return prefs.setStringList('tasks', jsonTasks);
    } else {
      // Si no hay tareas, no hay nada que eliminar
      return false;
    }
  }

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = prefs.getStringList('tasks') ?? [];
    return jsonTasks
        .map((jsonTask) => Task.fromJson(jsonDecode(jsonTask)))
        .toList();
  }

  Future<bool> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = tasks.map((e) => jsonEncode(e.toJson())).toList();
    return prefs.setStringList('tasks', jsonTasks);
  }
}
