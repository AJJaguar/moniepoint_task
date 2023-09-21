import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moniepoint_task/pages/search_view.dart';
import 'package:moniepoint_task/shipment_widget.dart';

import '../../shared/shared.dart';
import 'tabs.dart';

class ShipmentView extends StatefulHookWidget {
  const ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    final controller = useTabController(initialLength: 5);
    final animController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    useListenable(controller);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          // leading: CupertinoNavigationBarBackButton(),
          title: const FaderWidget(child: Text('Shipment history', style: TextStyle(

            fontSize: 10,
          ),)),

          bottom: FaderWidget(
            controller: animController,
            offset: const Offset(1, -0.5),
            child: TabBar(
                isScrollable: true,
                indicatorColor: const Color(0XFFF2781E),
                controller: _tabController,
                onTap: (val) {
                  setState(() {});
                },
                // controller: _tabController,
                // indicatorSize: ,
                // indi
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        const Text('All'),
                        const SizedBox(width: 5),
                        TabBarLabel(
                          index: 0,
                          tabController: _tabController,
                          length: '12',
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Text('Completed'),
                        const SizedBox(width: 5),
                        TabBarLabel(
                          tabController: _tabController,
                          length: '5',
                          index: 1,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Text('In progress'),
                        const SizedBox(width: 5),
                        TabBarLabel(
                          tabController: _tabController,
                          length: '3',
                          index: 2,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Text('Pending order'),
                        const SizedBox(width: 5),
                        TabBarLabel(
                          tabController: _tabController,
                          length: '4',
                          index: 3,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Text('Cancelled'),
                        const SizedBox(width: 5),
                        TabBarLabel(
                          tabController: _tabController,
                          index: 4,
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        body: FaderWidget(
          controller: animController,
          // offset: const Offset(1, -1),
          child: TabBarView(controller: _tabController, children: const [
            AllPage(),
            AllPage(),
            InProgressPage(),
            Pending(),
            AllPage()
          ]),
        ));
  }
}

class TabBarLabel extends StatelessWidget {
  final String? length;
  final int index;
  const TabBarLabel(
      {super.key,
      required TabController? tabController,
      this.length,
      required this.index})
      : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return length == null
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _tabController!.index == index
                  ? const Color(0XFFF17922)
                  : Colors.grey.withOpacity(0.2),
            ),
            child: Text(length!));
  }
}



class ShipmentWidget extends StatelessWidget {
  final ShipmentInfo shipmentInfo;
  const ShipmentWidget({super.key, required this.shipmentInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // height:
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const FaIcon(FontAwesomeIcons.load),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F4F5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(children: [
                shipmentInfo.status == Status.progress
                    ? Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: const Icon(Icons.cached,
                            color: Color(0XFF38C37F), size: 14),
                      )
                    : shipmentInfo.status == Status.loading
                        ? const Icon(Icons.history_toggle_off,
                            color: Color(0XFF1A71C1), size: 14)
                        : const Icon(Icons.history,
                            color: Color(0XFFF26F0D), size: 14),
                const SizedBox(
                  width: 5,
                ),
                shipmentInfo.status == Status.progress
                    ? const Text('in-progress',
                        style: TextStyle(
                          color: Color(0XFF38C37F),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ))
                    : shipmentInfo.status == Status.loading
                        ? const Text('loading',
                            style: TextStyle(
                              color: Color(0XFF1A71C1),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ))
                        : const Text(
                            'Pending',
                            style: TextStyle(
                              color: Color(0XFFF26F0D),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
              ]),
            ),
            const SizedBox(height: 10),
            const Text(
              'Arriving today!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Text(
                'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
                strutStyle: StrutStyle(fontSize: 10),
                softWrap: true,
                maxLines: 4,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('\$${shipmentInfo.price} USD',
                    style: const TextStyle(
                        color: Color(0XFF614FA0), fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0XFFD1D0D0),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Sep 20,2023',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
        Image.asset(
          'assets/images/package.png',
          width: 100,
          height: 100,
        ),
        const SizedBox(width: 2)
      ]),
    );
  }
}

class ShipmentInfo {
  Status status;
  String? price;

  ShipmentInfo({
    required this.status,
    this.price,
  });
}

enum Status {
  progress,
  loading,
  pending,
}
