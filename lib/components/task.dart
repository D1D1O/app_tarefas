import 'package:flutter/material.dart';
import 'package:projeto_001/components/difficulty.dart';
import 'package:projeto_001/data/task_dao.dart';
import 'package:projeto_001/data/task_inherited.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(
      {required this.dificuldade,
      required this.nome,
      this.foto = '',
      super.key});

  int nivel = 0;
  int nivelReal = 0;
  int nivelDf = 0;
  var color = Colors.blue;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  void calculaNivel() {
    try {
      widget.nivelReal++;
      //print(widget.nivelReal);

      if (widget.dificuldade == 0) {
        widget.nivelDf = 1;
      } else {
        widget.nivelDf = widget.dificuldade;
      }
      if (widget.nivelReal > 10 * widget.nivelDf &&
          widget.nivelReal <= 20 * widget.nivelDf) {
        widget.color = Colors.green;
      } else if (widget.nivelReal > 20 * widget.nivelDf &&
          widget.nivelReal <= 30 * widget.nivelDf) {
        widget.color = Colors.amber;
      } else if (widget.nivelReal > 30 * widget.nivelDf &&
          widget.nivelReal <= 40 * widget.nivelDf) {
        widget.color = Colors.purple;
      } else if (widget.nivelReal > 40 * widget.nivelDf &&
          widget.nivelReal <= 50 * widget.nivelDf) {
        widget.color = Colors.red;
      }

      if ((widget.nivel / widget.nivelDf) / 10 == 1) {
        widget.nivel = 0;
      }
      setState(
        () {
          widget.nivel++;
        },
      );
    } on Exception catch (exception) {
      print('Error');
    }
  }

  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.lightBlue),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: widget.color,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(widget.nome,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ))),
                          Difficulty(
                            difficultyLavel: widget.dificuldade,
                          )
                        ],
                      ),
                      ElevatedButton(
                        onLongPress: (){
                          TaskDao().delete(widget.nome);
                        },
                        onPressed: () {
                          calculaNivel();
                          TaskInherited.of(context)
                              .addGlobalLEvel(widget.dificuldade);
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 40,
                              width: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.arrow_drop_up),
                                  Text('UP')
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: (widget.dificuldade >= 1)
                                ? (widget.nivel / widget.dificuldade) / 10
                                : 1,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível: ${widget.nivel}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
