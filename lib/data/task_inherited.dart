import 'package:flutter/material.dart';
import 'package:projeto_001/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(dificuldade: 5, nome: 'Flutter', foto: 'assets/images/flutter.jpg'),
    Task(
        dificuldade: 3,
        nome: 'Kotlin para Android nativo',
        foto: 'assets/images/Kotlin.png'),
    Task(dificuldade: 1, nome: 'React', foto: 'assets/images/react.png'),
    Task(
        dificuldade: 0,
        nome: 'Swift',
        foto: 'assets/images/mascotes-da-copa.webp'),
    Task(
        dificuldade: 4,
        nome: 'Swift',
        foto: 'assets/images/mascotes-da-copa.webp'),
  ];

  int globalLevel = 0;
  void addGlobalLEvel(int difficulty){
    globalLevel = globalLevel + (1 * difficulty);

  }

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(
      dificuldade: difficulty,
      nome: name,
      foto: photo,
    ));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
