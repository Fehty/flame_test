
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class PageRenderer extends StatefulWidget {
  @override
  _PageRendererState createState() => _PageRendererState();
}

double lightRadiusValue = 300.0;
//List<double> translateValues = [0.0, 0.0];

class _PageRendererState extends State<PageRenderer>
    with SingleTickerProviderStateMixin {
//  List<List<Point3D>> circle = [];
//  List<List<Point3D>> circleStroke = [];
  List<bool> toggleOptions = [false, false];
  List shapeList = [];

//  Point3D A;
//  Point3D B;
//  Point3D C;
//  Point3D D;
//  Point3D strokeA;
//  Point3D strokeB;
//  Point3D strokeC;
//  Point3D strokeD;
//  Point3D I;
//  Point3D I22;
//  Point3D ps;
//  Point3D ps1;
//  Point3D ps2;
//  Point3D center;
//  Point3D center1;
//  Point3D center2;
//  Point3D A2;
//  double radius;
//
//  List<Way> choreographer = [];

  List<List<ZShape>> objects = [];

  double zoomValue = 0.5;
  double zoomSliderValue = 0.0;
  double lightRadiusSliderValue = 0.0;

  List<ZShape> temporaryList = [];

  @override
  void initState() {
    // Creating base Points
//    plane();

    // Adding Objects on screen
    initShape();

    super.initState();
  }

//    temporaryList.add(Shapes().quadrilateralPoints(A, B, C, D, scenario: 0.3));
  //shapeList.add( Shapes().quadrilateralSides(10, 20) );
//  plane() {
//    A = Point3D(0, 0, 0);
//    B = Point3D(-50, 0, 0);
//    C = Point3D(-50, 40, -10);
//    D = Point3D(0, 40, -10);
//    I = Point3D(0, 0, -100);
//    I22 = Point3D(0, 0, -200);
//    A2 = Point3D(50, 50, 50);
//
//    strokeA = Point3D().strokePoint(A, I22);
//    strokeB = Point3D().strokePoint(B, I22);
//    strokeC = Point3D().strokePoint(C, I22);
//    strokeD = Point3D().strokePoint(D, I22);
//
//    radius = 40;
//    ps = Point3D(40, 0, 0);
//    center = Point3D(0, 0, 0);
//    ps1 = Point3D(-50, -40, 0);
//    ps2 = Point3D(50, 40, 0);
//    center1 = Point3D(-50, 0, 0);
//    center2 = Point3D(130, 0, 0);
//
//    shapeList.addAll(Shapes().quadrilateralPoints(A, B, C, D, scenario: 0));
//    shapeList.addAll(Shapes().parallelepipedFull(A,
//        a: 40,
//        b: 40,
//        c: 10,
//        scenario: 0,
//        up: 90,
//        right: 0,
//        forward: 80,
//        radius: 60));
//
//    temporaryList.addAll(Shapes().parallelepipedFull(A,
//        a: 90,
//        b: 30,
//        c: 60,
//        scenario: 0.3,
//        up: 90,
//        right: 0,
//        forward: 80,
//        radius: 60));
//  }

  initShape() {
    /*
    shapeList.add(
        ZShape(path: [
          ZMove.only(x: A.x, y: A.y, z: A.z),
          ZLine.only(x: B.x, y: B.y, z: B.z),
          ZLine.only(x: C.x, y: C.y, z: C.z),
          ZLine.only(x: A.x, y: A.y, z: A.z),
          ZLine.only(x: D.x, y: D.y, z: D.z),
          ZLine.only(x: B.x, y: B.y, z: B.z),
          ZLine.only(x: C.x, y: C.y, z: C.z),
          ZLine.only(x: D.x, y: D.y, z: D.z),
        ], closed: true, stroke: 2, fill: false, color: Colors.yellow)
    );

     */

    //shapeList.addAll( Shapes().parallelepipedFull(A, a: 40, b: 70, c: 100) );

/*
    for (int i = 0; i< 110; i++){
      int adx = i*10;
      int ady = i*10;
      int adz = i*10;

      if (i%8 == 0){
        adx *=1;
        ady *=1;
        adz *=1;
      }

      if (i%8 == 1){
        adx *=-1;
        ady *=1;
        adz *=1;
      }

      if (i%8 == 2){
        adx *=-1;
        ady *=-1;
        adz *=1;
      }

      if (i%8 == 3){
        adx *=1;
        ady *=-1;
        adz *=1;
      }

      if (i%8 == 4){
        adx *=1;
        ady *=1;
        adz *=-1;
      }

      if (i%8 == 5){
        adx *=-1;
        ady *=1;
        adz *=-1;
      }

      if (i%8 == 6){
        adx *=-1;
        ady *=-1;
        adz *=-1;
      }

      if (i%8 == 7){
        adx *=1;
        ady *=-1;
        adz *=-1;
      }


      shapeList.add(
          ZShape(path: [
            ZMove.only(x: A.x+adx, y: A.y+ady, z: A.z+adz),
            ZLine.only(x: B.x+adx, y: B.y+ady, z: B.z+adz),
            ZLine.only(x: C.x+adx, y: C.y+ady, z: C.z+adz),
            ZLine.only(x: A.x+adx, y: A.y+ady, z: A.z+adz),
            ZLine.only(x: D.x+adx, y: D.y+ady, z: D.z+adz),
            ZLine.only(x: B.x+adx, y: B.y+ady, z: B.z+adz),
            ZLine.only(x: C.x+adx, y: C.y+ady, z: C.z+adz),
            ZLine.only(x: D.x+adx, y: D.y+ady, z: D.z+adz),
          ], closed: true, stroke: 2, fill: false, color: Colors.yellow)
      );
    }

 */
    //shapeList.addAll(ShineSource(I).arcCone(40, center1, 0, -180, 0));
/*
    shapeList.add(ShineSource(I).plane(A, B));
    shapeList.add(ShineSource(I).plane(B, C));
    shapeList.add(ShineSource(I).plane(C, D));
    shapeList.add(ShineSource(I).plane(D, A));

    shapeList.add(ShineSource().pathShape([A, B, C, D]));

 */
    //shapeList.add(ShineSource().pathShape([strokeA, strokeB, strokeC, strokeD]));

//    shapeList.addAll(ShineSource(I).arcCone(radius, center, -200, -270, 0));
    /*
    ConeValues coneValues = ShineSource(I).arcCone( 40, center2, 0, 360, 0, 0);
    List<ZShape> arcShape = coneValues.coneShape;
    shapeList.addAll(arcShape);
    shapeList.add(ShineSource().pathShape(coneValues.firstBasisPoints));
    shapeList.add(ShineSource().pathShape(coneValues.secondBasisPoints));

 */
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.cyan,
//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.topRight,
//                  end: Alignment.bottomLeft,
//                  colors: [Colors.blue, Colors.red])),
          child: Stack(children: [
            ZDragDetector(builder: (context, controller) {
              return ZIllustration(zoom: 1.9, children: [
                ZPositioned(
                    rotate: ZVector.only(
                        x: controller.rotate.x, y: controller.rotate.y),
                    child: ZCone(diameter: 20,))
              ]);
            }),
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: ZDragDetector(builder: (context, controller) {
                  return ZIllustration(zoom: 1.9, children: [
                    ZPositioned(
                        rotate: ZVector.only(
                            x: controller.rotate.x, y: controller.rotate.y),
                        child: ZCone(diameter: 20,))
                  ]);
                })),
            Positioned(
                bottom: 20,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(children: [
//                        SliderTheme(
//                            data: SliderThemeData(trackHeight: 6),
//                            child: Slider(
//                                activeColor: Colors.cyanAccent,
//                                inactiveColor: Colors.cyan,
//                                value: lightRadiusSliderValue,
//                                onChanged: (value) {
//                                  setState(
//                                      () => lightRadiusSliderValue = value);
//                                  lightRadiusValue = 200 + value * 150;
//                                  initShape();
//                                })),
                          SliderTheme(
                              data: SliderThemeData(trackHeight: 6),
                              child: Slider(
                                  activeColor: Colors.greenAccent,
                                  inactiveColor: Colors.lightGreenAccent,
                                  value: zoomSliderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      shapeList.clear();
//                                      shapeList.addAll(Shapes()
//                                          .quadrilateralPoints(A, B, C, D,
//                                          scenario: value));
//                                      shapeList.addAll(Shapes()
//                                          .parallelepipedFull(A,
//                                          a: 40,
//                                          b: 40,
//                                          c: 10,
//                                          scenario: value,
//                                          up: 90,
//                                          right: 0,
//                                          forward: 80,
//                                          radius: 60));
                                      //shapeList.add( Shapes().quadrilateralSides(10, 20) );
                                      //shapeList.add( Shapes().parallelepipedSides(A, a: 40, b: 40, c: 10, scenario: value, up: 0, right: 0, forward: 0, radius: 40) );
                                      zoomSliderValue = value;
                                      zoomValue = 0.5 + value * 1.5;
                                    });
                                  })),
                          SizedBox(height: 12),
//                        Row(children: [
//                          ToggleButtons(
//                              children: <Widget>[Text('Move'), Text('Rotate')],
//                              color: Colors.white,
//                              selectedColor: Colors.white,
//                              fillColor: Colors.cyan,
//                              splashColor: Colors.white30,
//                              constraints: BoxConstraints(
//                                  minWidth: 70.0, minHeight: 48.0),
//                              borderWidth: 1.5,
//                              onPressed: (int index) {
//                                if (index == 0) {
//                                  setState(() =>
//                                      toggleOptions[0] = !toggleOptions[0]);
//                                } else if (index == 1) {
//                                  setState(() =>
//                                      toggleOptions[1] = !toggleOptions[1]);
//                                }
//                              },
//                              isSelected: toggleOptions),
//                          Spacer(),
//                          SizedBox(
//                              height: 48.0,
//                              child: RaisedButton(
//                                  color: Colors.cyan,
//                                  onPressed: () {},
//                                  child: Text('Reset'.toUpperCase(),
//                                      style: TextStyle(color: Colors.white))))
//                        ])
                        ]))))
          ]),
        ));
  }
}
