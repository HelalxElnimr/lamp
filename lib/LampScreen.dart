import 'package:flutter/material.dart';
class LampScreen extends StatefulWidget {
  @override
  _LampScreenState createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen> {
  @override
  bool turnoff =false;
  void Turnlamp ()
  {
    setState(() {
      turnoff = !turnoff;
    });
  }
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediahight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child:
            Container(
              width: mediawidth,
              height: mediahight,
              color: turnoff?Colors.black:Colors.white,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 20,
                    height: 100,
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      height: 500,
                      width: 400,
                      child: turnoff? CustomPaint(
                        painter: MyPainter(),
                        size: Size(500, 500),
                      ):null,
                    ),
                  ),
                  Positioned(
                    top: 140,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:turnoff? Colors.white:Colors.grey[300],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      height: 100,
                      width: 100,
//                      color: turnoff? Colors.grey[800]:Colors.grey,
                      child: CustomPaint(
                        painter: Mylamp(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    child: Container(
                      width: 5,
                      height: 640,
                      color: turnoff?Colors.blueGrey[800]: Colors.blueGrey[400],
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 90,
                    child: GestureDetector(
                      onTap: (){
                        Turnlamp();
                      },
                      child: Container(
                        width:50,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: turnoff?Colors.red:Colors.green,
                        ),
                        child: Center(child: Text(turnoff?"OFF":"ON",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),

                ],
              ),
            )
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  Paint _paint;
  MyPainter(){
    _paint=Paint()..color=Colors.yellow;
  }
  void paint(Canvas canvas,Size size)
  {
    var path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, 400);
    path.lineTo(0, 1000);
    path.lineTo(400, 1000);
    path.lineTo(400, 400);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
class Mylamp extends CustomPainter {
  @override
  Paint _paint;
  Mylamp(){
    _paint=Paint()..color=Colors.grey[600];
  }
  void paint(Canvas canvas,Size size)
  {
    var path = Path();
    path.moveTo(40, 0);
    path.lineTo(0, 50);
    path.lineTo(0, 100);
    path.lineTo(100, 100);
    path.lineTo(100, 50);
    path.lineTo(60, 0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

