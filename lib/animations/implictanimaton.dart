import 'package:flutter/material.dart';

class ImplictAnimation extends StatefulWidget {
  const ImplictAnimation({super.key});

  @override
  State<ImplictAnimation> createState() => _ImplictAnimationState();
}

const defaultWidth = 100.0;

class _ImplictAnimationState extends State<ImplictAnimation> {
  var _isZoomedIN = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implict Animations'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: _curve,
                width: _width,
                child: Image.asset('assets/images/wallpaper image.jpg'),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIN = !_isZoomedIN;
                  _buttonTitle = _isZoomedIN ? 'Zoom Out ' : 'Zoom In';
                  _width = _isZoomedIN
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomedIN ? Curves.bounceInOut : Curves.bounceOut;
                });
              },
              child: Text(_buttonTitle)),
        ],
      ),
    );
  }
}
