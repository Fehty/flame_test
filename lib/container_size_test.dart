import 'package:flutter/material.dart';

class ContainerSizeTest extends StatefulWidget {
  @override
  _ContainerSizeTestState createState() => _ContainerSizeTestState();
}

class _ContainerSizeTestState extends State<ContainerSizeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Stack(children: [
          Center(child: Container(width: 306, height: 165, color: Colors.blue)),
          Center(child: Image.asset('assets/images/logo.png'))
        ]));
  }
}
