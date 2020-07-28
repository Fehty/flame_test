import 'dart:math';
import 'dart:ui';
import 'package:flame/sprite.dart';

import '../langaw_game.dart';

class Fly {
  final LangawGame langawGame;
  Paint paint;
  Rect rect;
  bool isDead = false;
  bool isOffScreen = false;

  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  bool flyUp = false;
  double yTranslate = 0;
  List<Offset> flyRoute;

  Fly(this.langawGame, [this.flyRoute]);

  render(Canvas canvas) {
    if (isDead) {
      deadSprite.renderRect(canvas, rect.inflate(30));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()]
          .renderRect(canvas, rect.inflate(30));
    }
  }

  update(double t) {
    flyingSpriteIndex += 30 * t;
    if (flyingSpriteIndex >= 2) {
      flyingSpriteIndex -= 2;
    }

    if (flyRoute.isNotEmpty) {
      rect = Rect.fromLTWH(flyRoute.first.dx, flyRoute.first.dy, 50, 50);
      flyRoute.removeAt(0);
    }

    switch (flyUp) {
      case false:
        if (yTranslate < 1) {
          yTranslate += t;
          rect = rect.translate(0, yTranslate);
        } else
          flyUp = true;
        break;
      case true:
        if (yTranslate > -1) {
          yTranslate -= t;
          rect = rect.translate(0, yTranslate);
        } else
          flyUp = false;
        break;
    }
  }
}
