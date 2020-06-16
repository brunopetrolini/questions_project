import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int score;
  final void Function() onFinish;

  const Results({Key key, this.score, this.onFinish}) : super(key: key);

  String get resultPhrase {
    if (score < 8)
      return 'Parabéns!';
    else if (score < 12)
      return 'Você é bom!';
    else if (score < 16)
      return 'Impressionante!';
    else
      return 'Nível Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Fim das perguntas',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        IconButton(
          tooltip: 'Reiniciar',
          icon: Icon(
            Icons.replay,
            size: 32,
          ),
          onPressed: onFinish,
        )
      ],
    );
  }
}
