import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                    ? const Icon(Icons.cached,
                        color: Color(0XFF38C37F), size: 14)
                    : shipmentInfo.status == Status.loading
                        ? const Icon(Icons.label,
                            color: Color(0XFF1A71C1), size: 14)
                        : const Icon(Icons.update,
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

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFF9F9F9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Shipments'),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Shipments'),
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
        ));
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
