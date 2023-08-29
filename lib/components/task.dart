import 'package:flutter/material.dart';
import 'package:projeto_001/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(
      {required this.dificuldade,
      required this.nome,
      this.foto = '',
      super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int nivelReal = 0;
  int nivelDf = 0;
  var color = Colors.blue;
  void calculaNivel(){
    try{
      nivelReal++;
      print(nivelReal);

      if (widget.dificuldade == 0){
        nivelDf = 1;
      }else{
        nivelDf = widget.dificuldade;
      }
      if(nivelReal > 10 * nivelDf && nivelReal <= 20 * nivelDf){
        color = Colors.green;
      }else if (nivelReal > 20 * nivelDf && nivelReal <= 30 * nivelDf){
        color = Colors.amber;
      }else if (nivelReal > 30 * nivelDf && nivelReal <= 40 * nivelDf){
        color = Colors.purple;
      }else if (nivelReal > 40 * nivelDf && nivelReal <= 50 * nivelDf){
        color = Colors.red;
      }

      if ((nivel/nivelDf)/10 == 1  ){
        nivel = 0;
      }
      setState(
            () {
          nivel++;
        },
      );

    }
    on Exception catch  (exception){
      print('Error');
    }
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
                color: color,
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
                          child: Image.asset(
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
                        onPressed: () {
                          calculaNivel();
                          //print(nivel);
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
                                ? (nivel / widget.dificuldade) / 10
                                : 1,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível: $nivel',
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
