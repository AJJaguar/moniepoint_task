import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFB),
      appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width,
          // toolbarHeight: 200,
          leading: Row(
            children: [
              const SizedBox(width: 15),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.near_me, size: 15, color: Colors.grey[300]),
                      const SizedBox(width: 5),
                      Text(
                        'Your location',
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Wertheimer, Illinois',
                        style: TextStyle(fontSize: 17),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 15)
          ],
          backgroundColor: Colors.deepPurple,
          bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFFF17922),
                            child: Icon(Icons.flip, color: Colors.white)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      hintText: 'Enter the receipt number ...'),
                ),
              ))),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF1A1D3D),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 8,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Shipment Number',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'NEJ20089934122231',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.asset('assets/images/truck.png'))
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    Row(
                      children: [
                        const SenderReceiver(
                          image: 'assets/images/sender.png',
                          title: 'Sender',
                          subtitle: 'Atlanta, 5243',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xFF52C73E),
                                ),
                                SizedBox(width: 4),
                                Text('2 day -3 days'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const SenderReceiver(
                          image: 'assets/images/receiver.png',
                          title: 'Receiver',
                          subtitle: 'Chicago, 6342',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text('Waiting to collect')
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Color(0XFFF17922), size: 20),
                        Text(
                          'Add Stop',
                          style: TextStyle(
                            color: Color(0XFFF17922),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Available vehicles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF1A1D3D),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Vehicle(
                      image: 'assets/images/boat.png',
                      subtitle: 'International',
                      title: 'Ocean freight',
                    ),
                    Vehicle(
                      image: 'assets/images/trailer.png',
                      subtitle: 'Reliable',
                      title: 'Cargo freight',
                    ),
                    Vehicle(
                      image: 'assets/images/boat.png',
                      subtitle: 'International',
                      title: 'Air freight',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Vehicle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const Vehicle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 20),
      margin: const EdgeInsets.only(right: 15),
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0XFF42454E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0XFFB9B8B9),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(image),
        )
      ]),
    );
  }
}

class SenderReceiver extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;

  const SenderReceiver({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(children: [
        image == null
            ? const SizedBox()
            : SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(image!),
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 3),
            Text(subtitle),
          ],
        )
      ]),
    );
  }
}
