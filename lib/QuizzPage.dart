import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1_cauty/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'HomePage.dart';
import 'main.dart';

class QuizzPage extends StatefulWidget
{
  const QuizzPage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => SomeQuizzPageState();
}
class SomeQuizzPageState extends State<QuizzPage>
{
  final List<Widget> score = [];
  int countClick = 0;
  int numberQuestion = 0;
  int questionNumber = 0;
  bool isFinished = false;
  int totalRight=0;
  final List<Question> questions = [
    Question(questionText: "1+1 = 2", isCorrect: true),// 1
    Question(questionText: "1+2 = 2", isCorrect: false),// 2
    Question(questionText: "1+3 = 4", isCorrect: true),// 3
    Question(questionText: "1+2 = 3", isCorrect: true),// 4
    Question(questionText: "1+6 = 2", isCorrect: false),// 5
  ];

  bool _checkAnswer(bool choice, BuildContext context) {

    if (questions[questionNumber].isCorrect == choice)
    {
      score.add(const Icon(Icons.check, color: Colors.green));
      totalRight++;
      return true;
    }
    else
    {
      score.add(const Icon(Icons.close, color: Colors.red));
      return false;
    }
  }

  Question _nextQuestion() {

    if (questionNumber == questions.length-1) {
      isFinished = true;
      questionNumber++;

      Alert(
          context: context,
          title: "Fin du quizz",
          desc: "Votre score est : $totalRight/$questionNumber ",
          buttons: [
            DialogButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Rejouer",
                    style: TextStyle(color: Colors.white, fontSize: 22))),
            DialogButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text("Retour",
                    style: TextStyle(color: Colors.white, fontSize: 22)))]).show();

      isFinished = false;
      questionNumber = 0;
      score.clear();
      countClick = 0;
      totalRight = 0;

      return questions[questionNumber];
    }
    return questions[questionNumber++];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 70,top: 6,left: 50,right: 50),
              child: Image.asset('images/maths.jpeg',width: 300, height:200 ,fit: BoxFit.cover,) ,
            ),
            Container(
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(questions[questionNumber].questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ButtonTheme(
                      minWidth: 60.0,
                      height: 35.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: (){
                          countClick++;
                          if(countClick == 1){
                            setState(() {
                              _checkAnswer(true,context);
                            });
                          }
                        }, child: const Text("Vrai", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ButtonTheme(
                      minWidth: 60.0,
                      height: 35.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: (){
                          countClick++;
                          if(countClick == 1){
                            setState(() {
                              _checkAnswer(false,context);
                            });
                          }
                        }, child: const Text("Faux", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ButtonTheme(
                      minWidth: 60.0,
                      height: 35.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: (){
                          countClick++;
                          if(countClick > 0 && questionNumber < questions.length){
                            setState(() {
                              countClick = 0;
                              _nextQuestion();
                            });
                          }
                        }, child: const Icon(Icons.arrow_right),),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: score,)
            )
          ],
        ),
      ),
    );
  }
}
/*
(countClick > 0 && _questionNumber <questions.length) {
countClick = 0;
 */

AppBar _getAppBar() {
  return AppBar(
    title: const Text('Quizz',
      style: TextStyle(color: Colors.white),),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}

