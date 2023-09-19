import 'dart:async';
import 'package:flutter/material.dart';



class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Trigger animations with a delay
    _animateWidgets();
  }

  void _animateWidgets() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isVisible1 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        isVisible2 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        isVisible3 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        isVisible4 = true;
        animationController.forward(); // Start the animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Animation Demo'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _buildSlideTransition(isVisible1, Colors.red),
            _buildSlideTransition(isVisible2, Colors.green),
            _buildSlideTransition(isVisible3, Colors.blue),
            _buildSlideTransition(isVisible4, Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideTransition(bool isVisible, Color color) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0, 0.5), // Slide from below
          end: Offset.zero,
        ).animate(CurvedAnimation(
          curve: Curves.easeInOut,
          parent: animationController,
        )),
        child: Container(
          height: 100,
          color: color,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller when done
    animationController.dispose();
    super.dispose();
  }
}
