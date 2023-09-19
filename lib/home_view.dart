import 'package:flutter/material.dart';
import 'package:moniepoint_task/pages/shipment.dart';

import 'pages/calculate_page.dart';
import 'pages/home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFB),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        // fixedColor: ,
        backgroundColor: const Color(0xffF4F4F4),
        items: List.generate(
          4,
          (index) => BottomNavigationBarItem(
            icon: _labelsIcons[index],
            label: _labels[index],
          ),
        ),
      ),
    );
  }

  int _currentPageIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    CalculatePage(),
    ShipmentView(),
    HomePage(),
  ];

  final List<String> _labels = [
    'Home',
    'Calculate',
    'Shipment',
    'Profile',
  ];
  final List<Icon> _labelsIcons = [
    const Icon(Icons.home_filled),
    const Icon(Icons.calculate_outlined),
    const Icon(Icons.history),
    const Icon(Icons.person_2_outlined),
  ];
}
