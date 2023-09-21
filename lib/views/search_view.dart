import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moniepoint_task/data/fake_data.dart';
import '../data/models/product_model.dart';
import '../shared/shared.dart';

class SearchView extends StatefulHookWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchView> {
  List<ProductModel> projects = [];
  List<ProductModel> fullProduct = [];
  late AnimationController animController;
  @override
  void initState() {
    fullProduct = productList.map((e) => ProductModel.fromMap(e)).toList();
    projects = fullProduct.take(5).toList();

    super.initState();
  }

  void onChanged(String? value) {
    if (value == null) return;
    projects = fullProduct
        .where(
          (element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.tag.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    animController.reset();
    animController.forward();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    animController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        leadingWidth: 30,
        title: Hero(
          tag: 'search',
          child: Material(
            type: MaterialType.transparency,
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0XFFF17922),
                      child: Transform.rotate(
                          angle: 90 * pi / 180, //set the angel
                          child: const Icon(
                            Icons.flip,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  hintText: 'Enter the receipt number ...'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FaderWidget(
          controller: animController,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
            child: ListView.builder(
              itemCount: projects.length,
              shrinkWrap: true,
              controller: controller,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = projects[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              radius: 15,
                              child: SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  'assets/images/packageicon.png',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  // style: AppTextStyle.medium16,
                                  style: const TextStyle(
                                      color: Color(0xff1C2435),
                                      // fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  // width: 300,
                                  // height: 20,
                                  child: Text(
                                    '${product.tag} • ${product.location}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (index != projects.length - 1)
                        const Divider(
                          thickness: 0.5,
                        ),
                      if (index == projects.length - 1)
                        const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
