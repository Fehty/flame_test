import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/backyard.dart';
import 'components/fly.dart';
import 'components/house_fly.dart';

class LangawGame extends Game with PanDetector {
  TextConfig fpsTextConfig;

  Size screenSize;
  List<Fly> flies;
  Backyard background;
  Random random;
  double tileSize;
  List<Offset> flyRoute;

  LangawGame() {
    initializer();
  }

  initializer() async {
    resize(await Flame.util.initialDimensions());
    random = Random();
    background = Backyard(this);
    flies = [];
    flyRoute = [];
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((element) {
      element.render(canvas);
    });
  }

  @override
  void update(double t) {
    flies.forEach((element) {
      element.update(t);
    });
    flies.removeWhere((element) => element.isOffScreen);
  }

  spawnFly() {
//    double x = random.nextDouble() * (screenSize.width - tileSize);
//    double y = random.nextDouble() * (screenSize.height - tileSize);
    flies.add(HouseFly(this, flyRoute));
//    switch (random.nextInt(5)) {
//      case 0:
//        flies.add(HouseFly(this, flyRoute));
//        break;
//      case 1:
//        flies.add(DroolerFly(this, x, y));
//        break;
//      case 2:
//        flies.add(AgileFly(this, x, y));
//        break;
//      case 3:
//        flies.add(MachoFly(this, x, y));
//        break;
//      case 4:
//        flies.add(HungryFly(this, x, y));
//        break;
//    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  onPanUpdate(DragUpdateDetails details) {
    flyRoute.add(details.globalPosition);
  }

//  void onTapDown(TapDownDetails d) {
//    print(d.globalPosition);
////    for (Fly fly in flies) {
////      if (fly.rect.contains(d.globalPosition)) {
////        fly.onTapped();
////      }
////    }
//  }
}
