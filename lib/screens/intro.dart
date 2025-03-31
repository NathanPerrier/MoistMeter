import 'package:MoistMeter/components/intro/mission_view.dart';
import 'package:MoistMeter/components/intro/center_next_button.dart';
import 'package:MoistMeter/components/intro/future_vew.dart';
import 'package:MoistMeter/components/intro/vision_view.dart';
import 'package:MoistMeter/components/intro/splash_view.dart';
import 'package:MoistMeter/components/intro/top_back_skip_view.dart';
import 'package:MoistMeter/components/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
    setSystemUIOverlayStyle(context);
  }

  
  void setSystemUIOverlayStyle(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, 
        statusBarColor: Theme.of(context).colorScheme.surface, 
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    });
  }


  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(

      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            VisionView(
              animationController: _animationController!,
            ),
            MissionView(
              animationController: _animationController!,
            ),
            FutureView(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.pushNamed(context, '/signin');
  }
}