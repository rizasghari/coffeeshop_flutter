import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/colors.dart';
import '../ui/gradients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

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
        Container(
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
        ),
        Positioned(
          top: 15,
          left: 30,
          child: Container(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
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
          ),
        ),
      ],
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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Content Section"),
      ],
    );
  }
}
