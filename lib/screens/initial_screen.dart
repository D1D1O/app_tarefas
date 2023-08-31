import 'package:flutter/material.dart';
import 'package:projeto_001/components/task.dart';
import 'package:projeto_001/data/task_inherited.dart';
import 'package:projeto_001/screens/form_screen.dart';

class InitalScreen extends StatefulWidget {
  const InitalScreen({super.key});

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  bool opacidade = true;

  int difilculdadeMaxima = 0;

  double retornaProgressBar(List<Task> initTask) {
    double progressBar = 0;
    int nivelDificuldade;
    int nivelGlobal;
    nivelDificuldade =
        initTask.map((objeto) => objeto.dificuldade).reduce((a, b) => a + b);
    nivelGlobal = TaskInherited.of(context).globalLevel;

    if (nivelDificuldade > 0) {
      progressBar = (nivelGlobal / nivelDificuldade) / 10;
    }
    return progressBar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Container(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Tarefas',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(
                        value: retornaProgressBar(
                            TaskInherited.of(context).taskList),
                        color: Colors.amber,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                    Text(
                      'Nível Global: ${TaskInherited.of(context).globalLevel}',
                      style: TextStyle(fontSize: 15),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(
                            () {},
                          );
                        },
                        child: Icon(Icons.refresh)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(microseconds: 800),
        child: ListView(
          children: TaskInherited.of(context).taskList,
          padding: EdgeInsets.only(top: 8, bottom: 70),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*setState(() {
          opacidade = !opacidade;
        },);*/
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
