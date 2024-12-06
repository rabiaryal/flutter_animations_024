import 'package:flutter/material.dart';
import 'package:flutter_animations_024/animations/3danimations.dart';
import 'package:flutter_animations_024/animations/circularanimation.dart';
import 'package:flutter_animations_024/animations/rotatingrectanimation.dart';
import 'package:flutter_animations_024/otheranimation/heroanimation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RotatingRectAnimatiosn()));
                },
                buttonName: "Rectangular Animation"),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CircularAnimation()));
                },
                buttonName: "Flip Circular Animations"),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThreeDAnimations()));
                },
                buttonName: "3D- Animations"),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HeroAnimation()));
                },
                buttonName: "Hero Animation"),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({super.key, required this.onPressed, required this.buttonName});

  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xff344691),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
