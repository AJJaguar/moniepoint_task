import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/shared.dart';
import 'shipment_view.dart';



class AllPage extends StatefulHookWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFF9F9F9),
        body: SingleChildScrollView(
          child: FaderWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 5),
                  child: Text(
                    'Shipments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1B263C),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getAllShipments.length,
                    itemBuilder: (context, index) {
                      return ShipmentWidget(
                        shipmentInfo: getAllShipments[index],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}

class InProgressPage extends StatelessWidget {
  const InProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShipmentInfo> inProgressShipments =
        getAllShipments.where((e) => e.status == Status.progress).toList();
    return Scaffold(
        backgroundColor: const Color(0XFFF9F9F9),
        body: FaderWidget(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 5),
                  child: Text(
                    'Shipments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1B263C),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inProgressShipments.length,
                    itemBuilder: (context, index) {
                      return ShipmentWidget(
                        shipmentInfo: inProgressShipments[index],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShipmentInfo> inProgressShipments =
        getAllShipments.where((e) => e.status == Status.pending).toList();
    return Scaffold(
        backgroundColor: const Color(0XFFF9F9F9),
        body: FaderWidget(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 5),
                  child: Text(
                    'Shipments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1B263C),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inProgressShipments.length,
                    itemBuilder: (context, index) {
                      return ShipmentWidget(
                        shipmentInfo: inProgressShipments[index],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}



List<ShipmentInfo> getAllShipments = [
  ShipmentInfo(price: '1400', status: Status.progress),
  ShipmentInfo(price: '650', status: Status.pending),
  ShipmentInfo(price: '650', status: Status.pending),
  ShipmentInfo(price: '230', status: Status.loading),
  ShipmentInfo(price: '230', status: Status.loading),
  ShipmentInfo(price: '370', status: Status.progress),
  ShipmentInfo(price: '370', status: Status.progress),
  ShipmentInfo(price: '650', status: Status.pending),
  ShipmentInfo(price: '650', status: Status.pending),
];