import 'package:flutter/material.dart';

class ImplictAnimation extends StatefulWidget {
  const ImplictAnimation({super.key});

  @override
  State<ImplictAnimation> createState() => _ImplictAnimationState();
}

const defaultWidth = 100.0;

class _ImplictAnimationState extends State<ImplictAnimation> {
  var _isZoomedIn = false;
  // var _buttonTitle = 'Zoom In';
  // var _width = defaultWidth;
  // var _curve = Curves.bounceOut;

  // Dynamically calculates properties based on the current state
  String get buttonTitle => _isZoomedIn ? 'Zoom Out' : 'Zoom In';
  double get animatedWidth =>
      (_isZoomedIn ? MediaQuery.of(context).size.width : defaultWidth) *
      _currentSliderValue;
  Curve get animationCurve =>
      _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;

  void toggleZoom() {
    setState(() {
      _isZoomedIn = !_isZoomedIn;
    });
  }

  double _currentSliderValue = 0;

  // void callChnageValue(double x) {
  //   setState(() {
  //     _isZoomedIn = !_isZoomedIn;
  //     _buttonTitle = _isZoomedIn ? 'Zoom Out ' : 'Zoom In';
  //     _width = _isZoomedIn ? MediaQuery.of(context).size.width : defaultWidth;
  //     _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
  //   });
  // }

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
                curve: animationCurve,
                width: animatedWidth,
                child: Image.asset('assets/images/wallpaper image.jpg'),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Slider(
              value: _currentSliderValue,
              min: 0.1,
              max: 1,
              divisions: 10,
              label: _currentSliderValue.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  // _isZoomedIn = !_isZoomedIn;
                  // _buttonTitle = _isZoomedIn ? 'Zoom Out ' : 'Zoom In';
                  // _width = _isZoomedIn
                  //     ? MediaQuery.of(context).size.width * _currentSliderValue
                  //     : defaultWidth * _currentSliderValue;
                  // _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                });
              }),
          const SizedBox(
            height: 70,
          ),
          TextButton(
              onPressed: toggleZoom,

              // setState(() {
              //   _isZoomedIn = !_isZoomedIn;
              //   _buttonTitle = _isZoomedIn ? 'Zoom Out ' : 'Zoom In';
              //   _width = _isZoomedIn
              //       ? MediaQuery.of(context).size.width
              //       : defaultWidth;
              //   _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
              // });

              child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
