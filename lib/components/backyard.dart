import 'dart:ui';

import 'package:flame/sprite.dart';
import '../langaw_game.dart';

class Backyard {
  final LangawGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
  }

  void render(Canvas c) {
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
