// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/core.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({super.key});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  late Animation<double> _imageSizeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuListAnimation;
  late AnimationController _controller;
  late Animation<double> _menuWidthAnimation;

  @override
  void initState() {
    _searchController.text = "Toll Gate";

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward().whenComplete(() {
        Future.delayed(const Duration(milliseconds: 1000), () {});
      });

    _imageSizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
      ),
    );

    _menuListAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.9, curve: Curves.easeInOut),
      ),
    );

    _menuWidthAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImageAssets.locationMap, fit: BoxFit.cover),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Transform.scale(
                          scale: _imageSizeAnimation.value,
                          child: SearchField(
                            searchController: _searchController,
                            hint: "Search IDs",
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            onChange: (str) => (str),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Transform.scale(
                        scale: _imageSizeAnimation.value,
                        child: CircularContainer(
                          asset: SvgAssets.heart,
                          color: kWhite,
                          size: 46,
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 200,
            left: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child: Center(
                            child: AppText("8,5mn P", color: kWhite),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child:
                              Center(child: SvgPicture.asset(SvgAssets.heart)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 300,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child:
                              Center(child: SvgPicture.asset(SvgAssets.heart)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child:
                              Center(child: SvgPicture.asset(SvgAssets.heart)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 350,
            left: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child:
                              Center(child: SvgPicture.asset(SvgAssets.heart)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 420,
            right: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kBottomContainerSwicthTabColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          child:
                              Center(child: SvgPicture.asset(SvgAssets.heart)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    bottom: 100,
                    // left: 10,
                    left: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _toggleMenu,
                            child: Transform.scale(
                              scale: _imageSizeAnimation.value,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: kLocationTabColor.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(SvgAssets.heart),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Transform.scale(
                            scale: _imageSizeAnimation.value,
                            child: Container(
                              height: 50,
                              width: 50,
                              // padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kLocationTabColor.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: SvgPicture.asset(SvgAssets.heart)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 170,
                left: 40,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: _menuExpanded ? kMenuTabColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _menuExpanded
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () => _selectItem(index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: AppText(
                                    [
                                      "Cosy areas",
                                      "Price",
                                      "Infrastructure",
                                      "Without any layer"
                                    ][index],
                                    color: _selectedItem == index
                                        ? kTextPrimary3
                                        : kTextPrimary2,
                                  ),
                                ),
                              );
                            }),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              )
            ],
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                bottom: 100,
                // left: 10,
                right: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.scale(
                    scale: _imageSizeAnimation.value,
                    child: Container(
                      // height: 60,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kLocationTabColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Center(
                        child: AppText("List of variants",
                            color: kWhite, size: 14, weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  bool _menuExpanded = false;
  int? _selectedItem;

  void _toggleMenu() {
    setState(() {
      _menuExpanded = !_menuExpanded;
      if (!_menuExpanded && _selectedItem != null) {
        _menuExpanded = false;
      }
    });
  }

  void _selectItem(int index) {
    setState(() {
      _selectedItem = index;
      _menuExpanded = false;
    });
  }
}
