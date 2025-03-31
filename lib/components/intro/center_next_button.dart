import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;
  const CenterNextButton(
      {Key? key, required this.animationController, required this.onNextClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation =
        Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _signUpMoveAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation =
        Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Padding(
      padding:
          EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => AnimatedOpacity(
                opacity: animationController.value >= 0.2 &&
                        animationController.value <= 0.6
                    ? 1
                    : 0,
                duration: Duration(milliseconds: 480),
                child: _pageView(),
              ),
            ),
          ),
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Padding(
                padding: EdgeInsets.only(
                    bottom: 38 - (38 * _signUpMoveAnimation.value)),
                child: Container(
                  height: 58,
                  width: 58 + (200 * _signUpMoveAnimation.value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8 + 32 * (1 - _signUpMoveAnimation.value)),
                    color: Color(0xff132137),
                  ),
                  child: PageTransitionSwitcher(
                    duration: Duration(milliseconds: 480),
                    reverse: _signUpMoveAnimation.value < 0.7,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return SharedAxisTransition(
                        fillColor: Colors.transparent,
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                      );
                    },
                    child: _signUpMoveAnimation.value > 0.7
                        ? InkWell(
                            key: ValueKey('Sign Up button'),
                            onTap: onNextClick,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_rounded,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            key: ValueKey('next button'),
                            onTap: onNextClick,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SlideTransition(
              position: _loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By continuing you agree to our ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () { 
                      // showBottomSheet(
                      //   elevation: 10,
                      //   backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                      //   context: context,
                      //   showDragHandle: true,
                        
                      //   builder: (ctx) => Container(
                      //     height:  MediaQuery.of(context).size.height/2,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Container(
                      //       child: Column(
                      //         children: [
                      //           const Text(
                      //             "Terms And Conditions",
                      //             style: TextStyle(
                      //               color: Color(0xff132137),
                      //               fontSize: 22,
                      //               fontWeight: FontWeight.bold
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: const Text('By using MoistMeter, you agree to these Terms and Conditions. If you do not agree, do not use the App. You must be at least 18 years old or have the authority to bind an organization if using it on their behalf. The App provides crop irrigation alerts based on weather data, agrivoltaic system performance, and fog collection technology. Key features include Watering Alerts, Weather Data Integration, and System Monitoring. You must provide accurate farm details and ensure your device meets technical requirements. The App\’s recommendations are based on algorithms and data, but you remain responsible for final irrigation decisions. We respect your privacy; our Privacy Policy explains data collection and sharing with third-party integrations. The App may offer free and paid features, with payments processed securely and non-refundable unless required by law. The App is provided \"as is,\" and we are not liable for damages, including crop or revenue loss. Intellectual property rights belong to this company, and reproduction or distribution without consent is prohibited. We may suspend or terminate access for violations. Terms may be updated, and continued use after changes constitutes acceptance. These Terms are governed by queensland law, with disputes resolved via arbitration. Farmers should verify App recommendations with local conditions and expertise.'),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );
                                   
                        showModalBottomSheet(
                          context: context,
                          elevation: 10,
                          showDragHandle: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true, // Allows the sheet to expand fully
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                          ),
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              initialChildSize: 0.4, // Initial size of the sheet
                              minChildSize: 0.2, // Minimum size when collapsed
                              maxChildSize: 0.8, // Maximum size when expanded
                              builder: (BuildContext context, ScrollController scrollController) {
                                return Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: CustomScrollView(
                                    controller: scrollController,
                                    slivers: [
                                      SliverList.list(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Terms And Conditions",
                                                    style: TextStyle(
                                                      color: Color(0xff132137),
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Center(
                                                      child: Text(
                                                        'By using MoistMeter, you agree to these Terms and Conditions. If you do not agree, do not use the App. You must be at least 18 years old or have the authority to bind an organization if using it on their behalf. The App provides crop irrigation alerts based on weather data, agrivoltaic system performance, and fog collection technology. Key features include Watering Alerts, Weather Data Integration, and System Monitoring. You must provide accurate farm details and ensure your device meets technical requirements. The App\’s recommendations are based on algorithms and data, but you remain responsible for final irrigation decisions. We respect your privacy; our Privacy Policy explains data collection and sharing with third-party integrations. The App may offer free and paid features, with payments processed securely and non-refundable unless required by law. The App is provided \"as is,\" and we are not liable for damages, including crop or revenue loss. Intellectual property rights belong to this company, and reproduction or distribution without consent is prohibited. We may suspend or terminate access for violations. Terms may be updated, and continued use after changes constitutes acceptance. These Terms are governed by queensland law, with disputes resolved via arbitration. Farmers should verify App recommendations with local conditions and expertise.',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 16),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                          EdgeInsets.only(left: MediaQuery.of(context).size.width/4, right: MediaQuery.of(context).size.width/4, top: 16, bottom: 16),
                                                        ),
                                                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                                                        
                                                      ),
                                                      onPressed:() {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Agree',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    
                     
                    child: Text('Terms And Conditions',
                    style: 
                      TextStyle(
                        color: Color(0xff132137),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;

    if (animationController.value >= 0.7) {
      _selectedIndex = 3;
    } else if (animationController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i
                      ? Color(0xff132137)
                      : Color(0xffE3E4E4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
