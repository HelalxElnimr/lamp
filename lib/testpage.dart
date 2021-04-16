import 'package:flutter/material.dart';
class testpage extends StatefulWidget {
  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  @override
  bool turnoff =true;
  void Turnlamp ()
  {
    setState(() {
      turnoff = !turnoff;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Turnlamp();
      },
      child: Container(
        height: 200,
        width: 200,
        color: turnoff? Colors.red:Colors.green,
      ),
    );
  }
}
