import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Questions({
    Key key,
    @required this.questions,
    @required this.selectedQuestion,
    @required this.onAnswer,
  }) : super(key: key);

  bool get validSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answers =
        validSelectedQuestion ? questions[selectedQuestion]['answers'] : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            questions[selectedQuestion]['text'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ...answers.map((response) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 45,
              child: FlatButton(
                onPressed: () => onAnswer(response['score']),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color(0xffeceff1),
                child: Text(
                  response['value'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                highlightColor: const Color(0xffcfd8dc),
                textColor: const Color(0xff263238),
                disabledTextColor: const Color(0xffcfd8dc),
                disabledColor: const Color(0xffeceff1),
              ),
            ))
      ],
    );
  }
}
