import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/pages/search_view.dart';
import 'package:moniepoint_task/pages/success_view.dart';

import '../shared/fader_widget.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({super.key});

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  double appBarHeight = 220;

  // Initial height of the AppBar
  bool isExpanded = true; // Whether the AppBar is expanded

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        appBarHeight = appBarHeight / 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFBFAFB),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500), // Animation duration
            height: appBarHeight,
            child: AppBar(
              title: const FaderWidget(
                offset: Offset(0, 2),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: FaderWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Destination',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF1A1D3D),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Column(
                        children: const [
                          DestinationWidget(
                              icon: Icons.unarchive_outlined,
                              hintext: 'Sender location'),
                          SizedBox(height: 10),
                          DestinationWidget(
                              icon: Icons.archive_outlined,
                              hintext: 'Receiver location'),
                          SizedBox(height: 10),
                          DestinationWidget(
                              icon: Icons.scale_outlined,
                              hintext: 'Approx weight'),
                        ],
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Packaging',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF1A1D3D),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'What are you sending?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Image.asset('assets/images/box.png'),
                        ),
                        const SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            thickness: 1,
                          ),
                        ),
                        const Text(
                          'Box',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF1A1D3D),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF1A1D3D),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'What are you sending?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  FaderWidget(
                    offset: const Offset(0.5, 0),
                    child: Wrap(
                      spacing: 12,
                      children: List.generate(
                        7,
                        (index) => ChipButton(
                          text: _labels[index],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFF17922),
                          borderRadius: BorderRadius.circular(30.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class DestinationWidget extends StatelessWidget {
  final IconData icon;
  final String hintext;

  const DestinationWidget({
    super.key,
    required this.icon,
    required this.hintext,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      fillColor: const Color(0xFFF9F8F9),
      hintText: hintext,
      hintStyle: const TextStyle(
        fontSize: 18,
        color: Colors.grey,
      ),
      filled: true,
      // contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(width: 15),
        Icon(
          icon,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 30,
          child: VerticalDivider(
            thickness: 1,
          ),
        )
      ]),
    ));
  }
}

class ChipButton extends StatefulWidget {
  const ChipButton({super.key, required this.text});
  final String text;

  @override
  State<ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
        backgroundColor: const Color(0xFFFBFAFB),
        label: Text(widget.text),
        selected: isSelected,
        onSelected: (value) {
          setState(() {
            isSelected = !isSelected;
            print(isSelected);
          });
        },
        side: const BorderSide(
          color: Color(0XFFBDBCBD),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedColor: const Color(0XFF1E2C3D),
        checkmarkColor: Colors.white,
        labelStyle: isSelected
            ? const TextStyle(
                color: Colors.white,
              )
            : const TextStyle(color: Color(0XFF40454B)));
  }
}

final List<String> _labels = [
  'Documents',
  'Glass',
  'Liquid',
  'Food',
  'Electronic',
  'Product',
  'Others'
];
