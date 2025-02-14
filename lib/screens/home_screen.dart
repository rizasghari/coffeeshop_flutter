import 'package:coffee_shop_flutter/mock_data.dart';
import 'package:coffee_shop_flutter/screens/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../ui/colors.dart';
import '../ui/gradients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  final Logger _logger = Logger();

  @override
  void initState() {
    _tabController = TabController(
        length: Category.getSampleCategories().length,
        initialIndex: 0,
        animationDuration: const Duration(milliseconds: 300),
        vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(flex: 3, child: _heroSection()),
        Flexible(flex: 6, child: _contentSection()),
        // Other widgets
      ],
    );
  }

  Widget _heroSection() {
    return Container(
      padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(gradient: darkGradient),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              _locationSection(),
              const SizedBox(height: 20.0),
              _searchBarSection(),
            ],
          ),
          Positioned(bottom: -70, left: 0, right: 0, child: _banner()),
        ],
      ),
    );
  }

  Widget _banner() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _bannerBackground(),
        Positioned(
          top: 15,
          left: 30,
          child: _bannerPromo(),
        ),
        Positioned(
          bottom: 10,
          left: 30,
          child: _bannerText(),
        ),
      ],
    );
  }

  Widget _bannerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 30.0,
              clipBehavior: Clip.none,
              decoration: const BoxDecoration(
                gradient: darkGradient,
              ),
              child: Text(
                AppLocalizations.of(context)!.homeTopBannerTextLine1,
                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: -15,
              left: 3.0,
              child: Text(
                AppLocalizations.of(context)!.homeTopBannerTextLine1,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 30.0,
              clipBehavior: Clip.none,
              decoration: const BoxDecoration(
                gradient: darkGradient,
              ),
              child: Text(
                AppLocalizations.of(context)!.homeTopBannerTextLine2,
                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: -15,
              left: 3.0,
              child: Text(
                AppLocalizations.of(context)!.homeTopBannerTextLine2,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _bannerBackground() {
    return Container(
      width: double.infinity,
      height: 140,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: brownNormal,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: const Image(
        image: AssetImage("assets/images/home_top_banner.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bannerPromo() {
    return Container(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: badge,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Text(
        AppLocalizations.of(context)!.homeTopBannerBadge,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: white,
        ),
      ),
    );
  }

  Widget _locationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.homeTopLocationLabel,
          style: const TextStyle(
            color: greyLighter,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.homeTopLocationHint,
              style: const TextStyle(color: surfaceNormal, fontSize: 14),
            ),
            const SizedBox(
              width: 3.0,
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: surfaceNormal,
              size: 20.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _searchBarSection() {
    return Row(
      children: [
        Flexible(flex: 6, child: _searchBar()),
        const SizedBox(width: 10.0),
        Flexible(flex: 1, child: _filter()),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: greyNormal,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, color: white, size: 25.0),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: greyLighter, fontSize: 16.0),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.homeTopSearchHint,
                hintStyle: const TextStyle(color: greyLighter, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter() {
    return const SizedBox(
      height: 50.0,
      child: Image(
        image: AssetImage("assets/images/filter.png"),
      ),
    );
  }

  Widget _contentSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 0.0, right: 0.0),
      child: Container(
        color: whiteLight,
        child: Column(
          children: [
            _tabs(),
            _tabContent(),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.only(left: 0, right: 10),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tabs: List.generate(
        Category.getSampleCategories().length,
        (index) => _customTab(index, _tabController.index),
      ),
    );
  }

  Widget _tabContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: _tabController,
          viewportFraction: 1.0,
          children: Category.getSampleCategories()
              .map((tab) => Center(child: _itemsList(_tabController.index)))
              .toList(),
        ),
      ),
    );
  }

  Widget _itemsList(int index) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _item(index);
      },
      itemCount: 20,
    );
  }

  Widget _item(int index) {
    final String heroPhotoTag = "item_photo_$index";
    final String heroTitleTag = "item_title_$index";
    _logger.i("######## tag: $heroPhotoTag - $heroTitleTag");
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDetailsScreen(id: index)),
        );
      },
      child: Card(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Hero(
                      tag: heroPhotoTag,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image(
                          image: AssetImage("assets/images/item.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: const BoxDecoration(
                          color: grayTransparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: yellow,
                              size: 14.0,
                            ),
                            SizedBox(width: 3.0),
                            Text(
                              "5.0",
                              style: TextStyle(
                                color: white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Hero(
                  tag: heroTitleTag,
                  child: const Material(
                    color: Colors.transparent,
                    child: Text(
                      "Caffe Mocha",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: greyNormal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  "Deep Foam",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: greyLighter,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$ 2.99",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: 32.0,
                      height: 32.0,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: brownNormal,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: white,
                        size: 16.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTab(int index, int selectedIndex) {
    bool isSelected = index == selectedIndex;
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? brownNormal : unselectedTabBg,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          Category.getSampleCategories()[index].name,
          style: TextStyle(
            color: isSelected ? white : darkGradientEnd,
            fontSize: isSelected ? 16 : 14,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
