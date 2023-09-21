import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../shared/shared.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  int targetValue = 1460;
  int currentValue = 0;

  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Trigger animations with a delay
    _animateWidgets();
  }

  void _animateWidgets() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isVisible1 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible2 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isVisible3 = true;
        animationController.forward(); // Start the animation
      });
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        isVisible4 = true;
        animationController.forward(); // Start the animation
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible5 = true;
        animationController.forward(); // Start the animation
      });
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        isVisible6 = true;
        animationController.forward(); // Start the animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 120,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSlideTransition(
              isVisible1,
              SizedBox(
                  height: 150,
                  width: 200,
                  child: Image.asset('assets/images/movemate.png')),
            ),
            _buildSlideTransition(
              isVisible2,
              SizedBox(
                height: 150,
                width: 200,
                child: Image.asset('assets/images/bigbox.png'),
              ),
            ),
            const SizedBox(height: 20),
            _buildSlideTransition(
              isVisible3,
              const Text(
                'Total Estimated Amount',
                style: TextStyle(
                  color: Color(0xFF232733),
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildSlideTransition(
              isVisible4,
              Center(
                child: TweenAnimationBuilder(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  tween: IntTween(begin: 0, end: targetValue),
                  builder: (BuildContext context, int value, Widget? child) {
                    currentValue = value; // Update the current value
                    return RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Color(0xFF57C696),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\$$currentValue ',
                              style: const TextStyle(fontSize: 20)),
                          const TextSpan(
                              text: 'USD', style: TextStyle(fontSize: 16))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildSlideTransition(
              isVisible5,
              const SizedBox(
                height: 60,
                width: 260,
                child: Text(
                  'This amount is estimated this will vary if you change your location or weight',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            _buildSlideTransition(
              isVisible6,
              AppButton(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                text: 'Back to home',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSlideTransition(bool isVisible, Widget child) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.5), // Slide from below
            end: Offset.zero,
          ).animate(CurvedAnimation(
            curve: Curves.easeInOut,
            parent: animationController,
          )),
          child: child),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller when done
    animationController.dispose();
    super.dispose();
  }
}
