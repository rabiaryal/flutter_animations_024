import 'package:flutter/material.dart';

class DoorRectAnm extends StatefulWidget {
  const DoorRectAnm({super.key});

  @override
  State<DoorRectAnm> createState() => _DoorRectAnmState();
}

class _DoorRectAnmState extends State<DoorRectAnm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Door Animations'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(100, 100, 100, 100),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
