import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moniepoint_task/shipment_widget.dart';

class ShipmentView extends StatefulWidget {
  const ShipmentView({super.key});

  @override
  State<ShipmentView> createState() => _ShipmentViewState();
}

class _ShipmentViewState extends State<ShipmentView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          opacity = 1;
        });
      }
    });

    return Scaffold(
        appBar: AppBar(
          // leading: CupertinoNavigationBarBackButton(),
          title: const Text('Shipment history'),

          bottom: TabBar(
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
                      Text('Completed'),
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
                      Text('In progress'),
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
                      Text('Pending order'),
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
        body: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 1),
          child: TabBarView(controller: _tabController, children: [
            const AllPage(),
            Container(
              color: Colors.green,
              child: Text('me'),
            ),
            InProgressPage(),
            Container(
              color: Colors.green,
              child: Text('me'),
            ),
            Container(
              color: Colors.green,
              child: Text('me'),
            )
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
