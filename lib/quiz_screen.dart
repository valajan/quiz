import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<List<Map<String, Object>>> loadJsonData(quiz) async {
  String jsonString = await rootBundle.loadString(quiz);
  Map<String, dynamic> jsonData = json.decode(jsonString);
  List<dynamic> dataList = jsonData['data'];
  List<Map<String, Object>> data = List<Map<String, Object>>.from(
    dataList.map((item) => Map<String, Object>.from(item)),
  );
  return data;
}

Future<String> loadJsonTitle(quiz) async {
  String jsonString = await rootBundle.loadString(quiz);
  Map<String, dynamic> jsonData = json.decode(jsonString);
  return jsonData["name"];
}

class ResultsScreen extends StatelessWidget {
  final int totalScore;
  final int questionCount;

  const ResultsScreen({
    Key? key,
    required this.totalScore,
    required this.questionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Résultats du quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vous avez obtenu un total de $totalScore sur $questionCount.",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Text("Revenir à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String quiz;

  const QuizScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _totalScore = 0;
  List<Map<String, Object>> _questions = [];
  String title = "";

  @override
  void initState() {
    super.initState();
    loadJsonData(widget.quiz).then((data) {
      setState(() {
        _questions = data;
      });
    });
    loadJsonTitle(widget.quiz).then((data) {
      setState(() {
        title = data;
      });
    });
  }

  void _answerQuestion(int answerIndex) {
    if (_questions[_questionIndex]['answerIndex'] == answerIndex.toString()) {
      setState(() {
        _totalScore++;
      });
    } else {
      _totalScore >= 1 ? _totalScore-- : _totalScore = 0;
    }

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            totalScore: _totalScore,
            questionCount: _questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Center(
        child:
            CircularProgressIndicator(), // ou tout autre indicateur de chargement
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['questionText'].toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GridView.count(
              padding: EdgeInsets.all(32),
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: (_questions[_questionIndex]['options'] as List<dynamic>)
                  .cast<String>()
                  .asMap()
                  .entries
                  .map((option) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _answerQuestion(option.key);
                          },
                          child: Text(option.value),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      );
    }
  }
}
