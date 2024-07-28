import 'package:coffee_shop_flutter/ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../ui/gradients.dart';

class ItemDetailsScreen extends StatefulWidget {
  final int id;

  const ItemDetailsScreen({super.key, required this.id});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteLight,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: whiteLight,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: const Image(
                  image: AssetImage("assets/images/item.png"),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
