import 'package:flame/animation.dart' as animation;
import 'dart:math' as math;
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flame/box2d/box2d_game.dart';
import 'package:flame/box2d/contact_callbacks.dart';
import 'package:flame/gestures.dart';
import 'package:flame/palette.dart';
import 'package:box2d_flame/box2d.dart';
import 'flame_boundaries/boundaries.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  final MyBox2D box = MyBox2D();
  game = MyGame(box);
  runApp(game.widget);
}

MyGame game;

class Ball extends BodyComponent {
  Paint originalPaint, currentPaint;
  bool giveNudge = false;

  Ball(Vector2 position, Box2DComponent box) : super(box) {
    originalPaint = _randomPaint();
    currentPaint = originalPaint;
    final worldPosition = viewport.getScreenToWorld(position);
    _createBody(5.0, worldPosition);
  }

  Paint _randomPaint() {
    final rng = math.Random();
    return PaletteEntry(
      Color.fromARGB(100 + rng.nextInt(155), 100 + rng.nextInt(155),
          100 + rng.nextInt(155), 255),
    ).paint;
  }

  void _createBody(double radius, Vector2 position) {
    final CircleShape shape = CircleShape();
    shape.radius = radius;

    final fixtureDef = FixtureDef()
      ..shape = shape
      ..restitution = 1.0
      ..density = 1.0
      ..friction = 0.1;

    final bodyDef = BodyDef()
      // To be able to determine object in collision
      ..setUserData(this)
      ..position = position
      ..type = BodyType.DYNAMIC;

    body = world.createBody(bodyDef)..createFixtureFromFixtureDef(fixtureDef);
  }

  @override
  bool destroy() {
    // Implement your logic for when the component should be removed
    return false;
  }

  @override
  void renderCircle(Canvas c, Offset p, double radius) {
    final blue = const PaletteEntry(Colors.blue).paint;
    c.drawCircle(p, radius, currentPaint);

    final angle = body.getAngle();
    final lineRotation =
        Offset(math.sin(angle) * radius, math.cos(angle) * radius);
    c.drawLine(p, p + lineRotation, blue);
  }

  @override
  void update(double t) {
    super.update(t);
    if (giveNudge) {
      body.applyLinearImpulse(Vector2(0, 10000), body.getLocalCenter(), true);
      giveNudge = false;
    }
  }
}

class WhiteBall extends Ball {
  WhiteBall(Vector2 position, Box2DComponent box) : super(position, box) {
    originalPaint = BasicPalette.white.paint;
    currentPaint = originalPaint;
  }
}

class BallContactCallback extends ContactCallback<Ball, Ball> {
  @override
  void begin(Ball ball1, Ball ball2, Contact contact) {
    if (ball1 is WhiteBall || ball2 is WhiteBall) {
      return;
    }
    if (ball1.currentPaint != ball1.originalPaint) {
      ball1.currentPaint = ball2.currentPaint;
    } else {
      ball2.currentPaint = ball1.currentPaint;
    }
  }

  @override
  void end(Ball ball1, Ball ball2, Contact contact) {}
}

class WhiteBallContactCallback extends ContactCallback<Ball, WhiteBall> {
  @override
  void begin(Ball ball, WhiteBall whiteBall, Contact contact) {
    ball.giveNudge = true;
  }

  @override
  void end(Ball ball, WhiteBall whiteBall, Contact contact) {}
}

class BallWallContactCallback extends ContactCallback<Ball, Wall> {
  @override
  void begin(Ball ball, Wall wall, Contact contact) {
    wall.paint = ball.currentPaint;
  }

  @override
  void end(Ball ball1, Wall wall, Contact contact) {
    Vector2 position = Vector2(20, 30);
    game.box.add(Ball(position, game.box));
  }

}

class MyGame extends Box2DGame with TapDetector {
  MyGame(Box2DComponent box) : super(box) {
    final boundaries = createBoundaries(box);
    boundaries.forEach(add);
    addContactCallback(BallContactCallback());
    addContactCallback(BallWallContactCallback());
    addContactCallback(WhiteBallContactCallback());
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    final Vector2 position =
        Vector2(details.globalPosition.dx, details.globalPosition.dy);
    if (math.Random().nextInt(10) < 2) {
      add(WhiteBall(position, box));
    } else {
      add(Ball(position, box));
    }
  }
}

class MyBox2D extends Box2DComponent {
  MyBox2D() : super(scale: 4.0, gravity: -10.0);

  @override
  void initializeWorld() {}
}

//import 'package:flame/flame.dart';
//import 'package:flame/sprite.dart';
//import 'package:flame/spritesheet.dart';
//import 'package:flutter/material.dart';
animation.Animation anim;
//import 'zflutter_test/maze.dart';
//

//Sprite sprite;
//
//main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  sprite = await Sprite.loadSprite('minotaur.png', width: 96, height: 96);
//  await Flame.images.load('minotaur.png');
//  final _animationSpriteSheet = SpriteSheet(
//      imageName: 'minotaur.png',
//      columns: 8,
//      rows: 1,
//      textureWidth: 96,
//      textureHeight: 96);
//  anim = _animationSpriteSheet.createAnimation(0, stepTime: 0.1, to: 8);
//  runApp(MyApp());
//}
//

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//            primarySwatch: Colors.blue,
//            visualDensity: VisualDensity.adaptivePlatformDensity),
//        home: Maze());
//  }
//}
//
//main() {
//  LangawGame game = LangawGame();
//  runApp(game.widget);
//
//  Util flameUtil = Util();
//  flameUtil.fullScreen();
//  flameUtil.setOrientation(DeviceOrientation.portraitUp);
//
//  //Preload and cache
//  Flame.images.loadAll(<String>[
//    'bg/backyard.png',
//    'flies/agile-fly-1.png',
//    'flies/agile-fly-2.png',
//    'flies/agile-fly-dead.png',
//    'flies/drooler-fly-1.png',
//    'flies/drooler-fly-2.png',
//    'flies/drooler-fly-dead.png',
//    'flies/house-fly-1.png',
//    'flies/house-fly-2.png',
//    'flies/house-fly-dead.png',
//    'flies/hungry-fly-1.png',
//    'flies/hungry-fly-2.png',
//    'flies/hungry-fly-dead.png',
//    'flies/macho-fly-1.png',
//    'flies/macho-fly-2.png',
//    'flies/macho-fly-dead.png',
//  ]);
//
////  TapGestureRecognizer tapper = TapGestureRecognizer();
////  tapper.onTapDown = game.onTapDown;
////  flameUtil.addGestureRecognizer(tapper);
//
//  PanGestureRecognizer panGestureRecognizer = PanGestureRecognizer();
//  panGestureRecognizer.onUpdate = game.onPanUpdate;
//  flameUtil.addGestureRecognizer(panGestureRecognizer);
//}
