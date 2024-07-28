import 'package:coffee_shop_flutter/ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
      appBar: _appBar(),
      body: _content(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: whiteLight,
      title: const Text(
        'Details',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
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
    );
  }

  Widget _content() {
    return Container(
      color: whiteLight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _itemImage(),
                const SizedBox(height: 20.0),
                _itemDetails(),
                const SizedBox(height: 20.0),
                _itemDescription(),
                const SizedBox(height: 20.0),
                _sizeSelector(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _addToCart(),
          ),
        ],
      ),
    );
  }

  Widget _addToCart() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 25.0,
      ),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(color: greyLighter, fontSize: 14.0),
              ),
              SizedBox(height: 5.0),
              Text(
                "\$ 25.00",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: brownNormal),
              ),
            ],
          ),
          const SizedBox(width: 30.0),
          Expanded(
            child: ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFC67C4E)),
              ),
              child: Text(
                "Add to cart",
                style: TextStyle(
                    color: white, fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: const Image(
        image: AssetImage("assets/images/item.png"),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200.0,
      ),
    );
  }

  Widget _itemDetails() {
    return Text("Item Details");
  }

  Widget _itemDescription() {
    return Text("Item Description");
  }

  Widget _sizeSelector() {
    return Text("Size Selector");
  }
}
