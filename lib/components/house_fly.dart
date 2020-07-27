import 'dart:ui';

import 'package:flame/sprite.dart';
import '../langaw_game.dart';
import 'fly.dart';

class HouseFly extends Fly {
  HouseFly(LangawGame langawGame, List<Offset> flyRoute)
      : super(langawGame, flyRoute) {
    flyUp = true;
    rect = Rect.fromLTWH(langawGame.screenSize.width / 2 - 25,
        langawGame.screenSize.height / 2 - 25, 50, 50);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}
