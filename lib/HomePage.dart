import 'package:flutter/material.dart';

import 'package:tp1_cauty/QuizzPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: _getAppBar(),
       body: Container(
         alignment: Alignment.center,
         child: Stack(
           alignment: AlignmentDirectional.topCenter,
           clipBehavior: Clip.none,
           children: [
             _getCard(),
             Positioned(
                 top: -50,
                 child: _getAvatar(),
             ),
             Padding(
                padding: EdgeInsets.only(top: 300),
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzPage(title:"Questions/Réponses"))),
                  child: const Text("Quizz"),
                ),
             )
           ],
         ),
       ),

     );
  }

  Container _getCard()
  {
    return Container
      (
      width: 280.0,
      height: 260.0,
      padding: const EdgeInsets.only(left: 0.0,top: 100,right: 0.0,bottom: 0.0),
      decoration: const BoxDecoration
        (
        color: Colors.blue,
        borderRadius: BorderRadius.only
          (
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          ),
        ),
      child: const Column
        (
        children: [
          Text("Alexandre Cauty",style: TextStyle(color: Colors.white),),  
          Text("alexandre.cauty@etu.umontpellier.fr",style: TextStyle(color: Colors.white),),
          Text("Twitter : xxxx",style: TextStyle(color: Colors.white),)
        ],
        )
      );
  }

  Container _getAvatar(){
    return Container(
      width: 220,
      height: 120,
      margin: const EdgeInsets.only(top: 1.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: 1,color: Colors.blue),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/toji.jpg")),
        boxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 1.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Home Page',
        style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
}