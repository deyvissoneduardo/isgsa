import 'package:flutter/material.dart';

import '../../core/helpers/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimetionWidth => 200 * _scale;
  double get _logoAnimetionHeight => 200 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
          opacity: _animationOpacityLogo,
          onEnd: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 3),
            width: _logoAnimetionWidth,
            height: _logoAnimetionHeight,
            curve: Curves.linearToEaseOut,
            child: Image.asset(
              Constants.logopath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
