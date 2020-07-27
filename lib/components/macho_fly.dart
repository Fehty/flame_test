import 'dart:ui';

import 'package:flame/sprite.dart';
import 'fly.dart';
import '../langaw_game.dart';

class MachoFly extends Fly {
  MachoFly(LangawGame game, double x, double y) : super(game) {
    rect = Rect.fromLTWH(x, y, 50, 50);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
