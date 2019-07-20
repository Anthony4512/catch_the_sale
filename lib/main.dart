import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'dart:ui' as ui show Image;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Catch the Sale'),
    );
  }

  
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NodeWithSize rootNode;

  



  @override
  void initState() {
    super.initState();
    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));
    addBackground();
    showFurniture();
    showCart();
  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

  void showFurniture() async {

    ImageMap images = new ImageMap(rootBundle);

    ui.Image chairImage = await images.loadImage('assets/chair.png');

    Sprite chairSprite = new Sprite.fromImage(chairImage);

    chairSprite.position = const Offset(512, 256);

    chairSprite.size = const Size(50, 50);

    rootNode.addChild(chairSprite);
    
  }

   void showCart() async {

    ImageMap images = new ImageMap(rootBundle);

    ui.Image chairImage = await images.loadImage('assets/shoppingcart.png');

    Sprite chairSprite = new Sprite.fromImage(chairImage);

    chairSprite.position = const Offset(512, 930);

    chairSprite.size = const Size(128, 90);

    rootNode.addChild(chairSprite);
    
  }

  void addBackground() async {

    ImageMap images = new ImageMap(rootBundle);

    ui.Image backgroundImage = await images.loadImage('assets/background.jpg');

    Sprite backgroundSprite = new Sprite.fromImage(backgroundImage);

    backgroundSprite.position = const Offset(512, 512);
  
    backgroundSprite.size = const Size(600, 1024);

    rootNode.addChild(backgroundSprite);

  }

}