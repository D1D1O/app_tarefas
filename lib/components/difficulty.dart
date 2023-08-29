import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final difficultyLavel;
  const Difficulty({
    required this.difficultyLavel,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: difficultyLavel >= 1
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultyLavel >= 2
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultyLavel >= 3
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultyLavel >= 4
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultyLavel >= 5
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
      ],
    );
  }
}

