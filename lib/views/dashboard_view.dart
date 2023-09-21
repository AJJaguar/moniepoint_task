import 'package:flutter/material.dart';
import 'package:moniepoint_task/views/search_view.dart';
import 'package:moniepoint_task/views/shipment_view/shipment_view.dart';

import '../shared/shared.dart';
import 'calculate_view.dart';
import 'home_view.dart';
import 'profile_view.dart';
import 'success_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardView> {
  Widget _buildIndicator() {
    final double indicatorWidth = MediaQuery.of(context).size.width / 4;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: indicatorWidth,
      height: 4,
      color: Colors.deepPurple,
      margin: EdgeInsets.only(left: indicatorWidth * _currentPageIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFB),
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      bottomSheet:
          FaderWidget(offset: const Offset(0, 8), child: _buildIndicator()),
      body: _pages[0],
      bottomNavigationBar: FaderWidget(
        offset: const Offset(0, 2),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (int index) {
            setState(
              () {
                _currentPageIndex = index;
              },
            );
            Future.delayed(const Duration(milliseconds: 400), () {
              _currentPageIndex = 0;
              if (index != 0) {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return _pages[index];
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      var tween = Tween(begin: begin, end: end);
                      var fadeAnimation = animation.drive(tween);
                      return FadeTransition(
                        opacity: fadeAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              }

              Future.delayed(const Duration(milliseconds: 300), () {
                setState(() {
                  _currentPageIndex = 0;
                });
              });
            });
          },
          backgroundColor: const Color(0xFFFFFFFF),
          items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
              icon: _labelsIcons[index],
              label: _labels[index],
            ),
          ),
        ),
      ),
    );
  }

  int _currentPageIndex = 0;
}

final List<Icon> _labelsIcons = [
  const Icon(Icons.home_filled),
  const Icon(Icons.calculate_outlined),
  const Icon(Icons.history),
  const Icon(Icons.person_2_outlined),
];

const List<Widget> _pages = [
  HomeView(),
  CalculateView(),
  ShipmentView(),
  ProfileView()
];

final List<String> _labels = [
  'Home',
  'Calculate',
  'Shipment',
  'Profile',
];
