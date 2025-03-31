import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -2.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return Center(
      child: SlideTransition(
        position: _introductionanimation,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(
                    'assets/logos/logoIcon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    "Welcome To MoistMeter!",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 64, right: 64),
                  child: Text(
                    "MoistMeter is designed to simplify agriculture through our innovative app that provides unmatched features.",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 16),
                  child: InkWell(
                    onTap: () {
                      widget.animationController.animateTo(0.2);
                    },
                    child: Container(
                      height: 58,
                      padding: EdgeInsets.only(
                        left: 56.0,
                        right: 56.0,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38.0),
                        color: Color(0xff132137),
                      ),
                      child: Text(
                        "Let's begin",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
