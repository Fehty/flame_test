import 'dart:ui';

import 'package:flame/sprite.dart';
import 'fly.dart';
import '../langaw_game.dart';

class AgileFly extends Fly {
  AgileFly(LangawGame game, double x, double y) : super(game) {
    flyUp = true;
    rect = Rect.fromLTWH(x, y, 50, 50);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
