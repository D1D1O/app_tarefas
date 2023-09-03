import 'package:projeto_001/components/task.dart';
import 'package:projeto_001/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {}

  Future<List<Task>> findAll() async {
    print('Acessando o findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Encontrado no banco: $result ');

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        dificuldade: linha[_difficulty],
        nome: linha[_name],
        foto: linha[_image],
      );
      tarefas.add(tarefa);
    }
    print('Lista de tarefas: $tarefas');

    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find:');

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      //columns: [_name, _image, _difficulty],
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa]
    );
    print('Tarefa encontrada $result');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}