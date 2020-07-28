import 'dart:math';

import 'package:flame/anchor.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets/animation_widget.dart';
import 'package:flame/widgets/sprite_widget.dart';
import 'package:flame_test/main.dart';
import 'package:flame_test/zflutter_test/linear_equation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class Maze extends StatefulWidget {
  @override
  _MazeState createState() => _MazeState();
}

class _MazeState extends State<Maze> with TickerProviderStateMixin {
  Size screenSize;

//  Size engineScreenSize;

  Point lastPoint = Point(0.0, 0.0);
  Point newPoint;
  List<Point> border;

  AnimationController _xCoordinateController;
  Animation _xCoordinateAnimation;

  @override
  void initState() {
    double y = -300;
    while (y < 300) {
      y += 1;
    }
    super.initState();
  }

  void onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    // New point
    // +56 because of the character's axe
    double x = (screenSize.width / 2 - screenSize.width + localOffset.dx) + 56;
    double y =
        (screenSize.height / 2 - screenSize.height + localOffset.dy) + 48;

    print(y);
    newPoint = Point(x, y);

    _xCoordinateController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _xCoordinateAnimation = Tween(begin: lastPoint.x, end: newPoint.x)
        .animate(_xCoordinateController);
    _xCoordinateController.forward();
    _xCoordinateAnimation.addListener(() {
      double y = linearEquationGetY(
          LinearPoints(lastPoint.x, lastPoint.y, newPoint.x, newPoint.y),
          _xCoordinateAnimation.value);
      setState(() => lastPoint = Point(_xCoordinateAnimation.value, y));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    screenSize = Size(width, height);
//    double engineWidth = (screenSize.width / 2 - screenSize.width) - width;
//    double engineHeight = (screenSize.height / 2 - screenSize.height) + height;
//    engineScreenSize = Size(engineWidth, engineHeight);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.indigo,
        child: GestureDetector(
            onTapDown: (TapDownDetails details) => onTapDown(context, details),
            child: ZIllustration(zoom: 1, children: [
              ZPositioned.translate(
                  x: lastPoint.x,
                  y: lastPoint.y,
                  child: ZToBoxAdapter(
                      width: 200,
                      height: 200,
                      child: AnimationWidget(animation: anim))),
//                  rotate: ZVector.only(x: -controller.rotate.x / 2, y: -controller.rotate.y / 2),
////                rotate: controller.rotate,
////                  child: ZToBoxAdapter(
////                      width: 100,
////                      height: 100,
////                      child: Container(
////                        color: Colors.blue,
////                        width: 100,
////                        height: 100,
////                      )),
//                  ZToBoxAdapter(
//                        width: 200,
//                        height: 200,
//                        child: AnimationWidget(animation: anim)),
//              ZShape(
//                path: [
//                  ZMove.only(x: -32, y: -40), // start at top left
//                  ZLine.only(x: 32, y: -40), // line to top right
//                  ZLine.only(x: -32, y: 40), // line to bottom left
//                  ZLine.only(x: 32, y: 40), // line to bottom right
//                ],
//
//                closed: true,
//                stroke: 10,
//                color: Colors.red,
//              )
//                ZPositioned(
//                    rotate: ZVector.only(z: -3.5),
//                    child: ZToBoxAdapter(
//                        width: 150,
//                        height: 600,
//                        child: Container(color: Colors.cyan)))
            ])));
  }
}
//return Container(
//color: Colors.indigo,
//child: Stack(
//children: [
//ZDragDetector(builder: (context, controller) {
//print(-controller.rotate.x * 30);
//return ZIllustration(zoom: 1, children: [
//ZPositioned.translate(
//x: x,
//y: y,
////                  rotate: ZVector.only(x: -controller.rotate.x / 2, y: -controller.rotate.y / 2),
////                rotate: controller.rotate,
//child: ZToBoxAdapter(
//width: 100,
//height: 100,
//child: Container(
//color: Colors.blue,
//width: 100,
//height: 100,
//)),
////                    child: ZToBoxAdapter(
////                        width: 200,
////                        height: 200,
////                        child:
////                            Container(child: AnimationWidget(animation: anim)))
//)
//]);
//}),
//],
//));
