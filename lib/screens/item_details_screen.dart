import 'package:coffee_shop_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import '../enums.dart';
import '../mock_data.dart';
import '../ui/widgets/read_more_less_text.dart';

class ItemDetailsScreen extends StatefulWidget {
  final int id;

  const ItemDetailsScreen({super.key, required this.id});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final Logger _logger = Logger();
  Set<CoffeeSize> _coffeeSizeSelection = <CoffeeSize>{CoffeeSize.medium};

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
      title: Text(
        AppLocalizations.of(context)!.itemDetailsTitle,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsetsDirectional.only(start: 25.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 25.0),
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
      height: MediaQuery.of(context).size.height,
      color: whiteLight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 25.0, right: 25.0, bottom: 150.0),
            child: SingleChildScrollView(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.itemDetailsPriceLabel,
                style: const TextStyle(color: greyLighter, fontSize: 14.0),
              ),
              const SizedBox(height: 5.0),
              const Text(
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
                AppLocalizations.of(context)!.itemDetailsBuyNow,
                style: const TextStyle(
                    color: white, fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemImage() {
    final String tag = "item_photo_${widget.id}";
    _logger.i("######## photo tag: $tag");
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: const Image(
          image: AssetImage("assets/images/item.png"),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.0,
        ),
      ),
    );
  }

  Widget _itemDetails() {
    final String tag = "item_title_${widget.id}";
    _logger.i("######## title tag: $tag");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: "item_title_${widget.id}",
          child: Material(
            color: Colors.transparent,
            child: Text(
              AppLocalizations.of(context)!.itemDetailsItemTitle,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: greyNormal),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.itemDetailsItemType,
              style: const TextStyle(color: greyLighter, fontSize: 12.0),
            ),
            SizedBox(
              height: 44,
              width: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ItemFeature.getSampleItemFeatures().length,
                itemBuilder: (context, index) {
                  return _itemDetailsFeature(index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 12.0);
                },
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: yellow, size: 20.0),
            SizedBox(width: 5.0),
            Text(
              "4.8",
              style: TextStyle(
                  color: greyNormal,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5.0),
            Text(
              "(122)",
              style: TextStyle(color: greyLighter, fontSize: 12.0),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Divider(
          thickness: 1,
          color: surfaceLightActive,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }

  Widget _itemDetailsFeature(int index) {
    return Container(
      width: 44.0,
      height: 44.0,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: unselectedTabBg,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Image(
        width: 20.0,
        height: 20.0,
        image: AssetImage(ItemFeature.getSampleItemFeatures()[index].image),
      ),
    );
  }

  Widget _itemDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.itemDetailsItemDescriptionTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        ReadMoreLessText(
            text: AppLocalizations.of(context)!.itemDetailsDescription)
      ],
    );
  }

  Widget _sizeSelector() {
    return SegmentedButton<CoffeeSize>(
      multiSelectionEnabled: false,
      emptySelectionAllowed: false,
      showSelectedIcon: true,
      selected: _coffeeSizeSelection,
      onSelectionChanged: (Set<CoffeeSize> newSelection) {
        setState(() {
          _coffeeSizeSelection = newSelection;
        });
      },
      segments: coffeeSizes.map<ButtonSegment<CoffeeSize>>(
        ((CoffeeSize, String) size) {
          return ButtonSegment<CoffeeSize>(
            value: size.$1,
            label: Text(size.$2),
          );
        },
      ).toList(),
    );
  }
}
