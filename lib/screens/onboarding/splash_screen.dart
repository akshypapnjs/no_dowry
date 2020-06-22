import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_dowry/framework_helper/super_state.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/screens/onboarding/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends SuperState<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    _inItAnimation();
    _splashTask();
    super.initState();
  }

  @override
  normalState() {
    return Material(
      child: Container(
          color: Themes.primaryColor,
          width: screenWidth(),
          height: screenHeight(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.homeBottomImage,
                width: _iconAnimation.value * 500.0,
                height: _iconAnimation.value * 500.0,
              ),
            ],
          )),
    );
  }

  _splashTask() async {
    var _duration = new Duration(seconds: Constants.splashDelay);
    return new Timer(_duration, _onLoadingComplete);
  }

  void _onLoadingComplete() {
    moveClear(LoginScreen());
  }

  void _inItAnimation() {
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
}
