import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_test/container_size_test.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flame/animation.dart' as animation;
import 'package:flame/spritesheet.dart';
import 'zflutter_test/maze.dart';

animation.Animation anim;
Sprite sprite;
//import 'package:flame/flame.dart';
//import 'package:flame/sprite.dart';
//import 'package:flame/spritesheet.dart';
//import 'package:flutter/material.dart';
//
//import 'container_size_test.dart';
//import 'zflutter_test/maze.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sprite = await Sprite.loadSprite('minotaur.png', width: 96, height: 96);
  await Flame.images.load('minotaur.png');
  final _animationSpriteSheet = SpriteSheet(
      imageName: 'minotaur.png',
      columns: 8,
      rows: 1,
      textureWidth: 96,
      textureHeight: 96);
  anim = _animationSpriteSheet.createAnimation(0, stepTime: 0.1, to: 8);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Maze());
  }
}

//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//double screenHeight;
//double screenWidth;
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    screenHeight = MediaQuery.of(context).size.height;
//    screenWidth = MediaQuery.of(context).size.width;
//    return Scaffold(body: Maze());
//  }
//}

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
