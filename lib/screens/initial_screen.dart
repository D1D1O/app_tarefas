
import 'package:flutter/material.dart';
import 'package:projeto_001/components/task.dart';


class InitalScreen extends StatefulWidget {
  const InitalScreen({super.key});

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(microseconds: 800),
        child: ListView(
          children: const [
            Task(
                dificuldade: 5,
                nome: 'Flutter',
                foto:
                'assets/images/flutter.jpg'),
            Task(
                dificuldade: 3,
                nome: 'Kotlin para Android nativo',
                foto:
                'assets/images/Kotlin.png'),
            Task(
                dificuldade: 1,
                nome: 'React',
                foto:
                'assets/images/react.png'),
            Task(
                dificuldade: 0,
                nome: 'Swift',
                foto:
                'assets/images/mascotes-da-copa.webp'),
            Task(
                dificuldade: 4,
                nome: 'Swift',
                foto:
                'assets/images/mascotes-da-copa.webp'),
            SizedBox(height: 80,)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          opacidade = !opacidade;
        },);
      },
        child: const Icon(Icons.remove_red_eye),),
    );
  }
}
