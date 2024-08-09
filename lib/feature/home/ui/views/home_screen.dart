// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _containerWidthAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _imageSizeAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fade2Animation;
  late Animation<Offset> _appTextSlideAnimation;

  late Animation<double> _scaleAnimation;
  late Animation<int> _numberAnimation;
  late Animation<int> _rentAnimaation;
  bool _showText = false;

  bool _showText1 = false;
  bool _showText2 = false;
  bool _showText3 = false;

  late Animation<Offset> _contentSlideAnimation;

  late Animation<double> _containerWidthAnimation2;

  late Animation<double> _textFadeAnimation;

  double _container1Width = 0.0;
  double _container2Width = 0.0;
  double _container3Width = 0.0;
  double _container4Width = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..forward().whenComplete(() {
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            _container1Width = 390.0;
            _container2Width = 180.0;
            _container3Width = 185.0;
            _container4Width = 185.0;
          });
          Future.delayed(const Duration(milliseconds: 1100), () {
            setState(() => _showText = true);
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() => _showText1 = true);
              Future.delayed(const Duration(milliseconds: 200), () {
                setState(() => _showText2 = true);
                Future.delayed(const Duration(milliseconds: 100), () {
                  setState(() => _showText3 = true);
                });
              });
            });
          });
        });
      });

    _containerWidthAnimation = Tween<double>(begin: 0, end: 190).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3 + 3 / 1500, 0.6 + 3 / 1500,
            curve: Curves.easeInOut),
      ),
    );

    _fade2Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3 + 3 / 1500, 0.6 + 3 / 1500,
            curve: Curves.easeInOut),
      ),
    );

    _imageSizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );

    _appTextSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeOut),
      ),
    );

    _numberAnimation = IntTween(begin: 0, end: 1034).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _rentAnimaation = IntTween(begin: 0, end: 2212).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _contentSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeInOut),
      ),
    );

    _containerWidthAnimation2 = Tween<double>(begin: 0, end: 250).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeOut),
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          ClipPath(
            clipper: OutwardCurvedBottomClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kHomeScreenBackgroundColor, kWhite],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: _containerWidthAnimation.value,
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 22, top: 16, bottom: 16),
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: _shadow,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SlideTransition(
                                        position: _textSlideAnimation,
                                        child: FadeTransition(
                                          opacity: _fade2Animation,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                SvgAssets.location,
                                                color: kTextPrimary,
                                                width: 22,
                                                height: 22,
                                              ),
                                              SizedBox(width: 5),
                                              AppText("Saint Petersburg",
                                                  size: 15,
                                                  color: kTextPrimary,
                                                  weight: FontWeight.w500),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Transform.scale(
                                  scale: _imageSizeAnimation.value,
                                  child: CircularImageContainer(
                                    asset: ImageAssets.person,
                                    margin: EdgeInsets.all(0),
                                    assetSize: 60,
                                    size: 60,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: AppText(
                                "Hi, Marina",
                                color: kTextPrimary,
                                size: 30,
                                weight: FontWeight.w500,
                              ),
                            ),
                            SlideTransition(
                              position: _appTextSlideAnimation,
                              child: FadeTransition(
                                opacity: _fadeAnimation,
                                child: AppText(
                                  "let's select your perfect place",
                                  color: kContrastColor,
                                  size: 45,
                                  weight: FontWeight.w500,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            _rentInfo,
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SlideTransition(
            position: _contentSlideAnimation,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Center(
                            child: Image.asset(ImageAssets.kitchen1),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 10,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 900),
                            width: _container1Width,
                            curve: Curves.easeOut,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: kSliderBgColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Stack(
                              children: [
                                if (_showText) ...[
                                  Positioned(
                                    bottom: 15,
                                    left: 120,
                                    // right: 10,
                                    child: FadeTransition(
                                      opacity: _textFadeAnimation,
                                      child: AppText(
                                        'Gladkova St., 25',
                                        size: 15,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircularContainerIcon(
                                    icon: CupertinoIcons.chevron_right,
                                    color: kWhite,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Center(
                                child: Image.asset(ImageAssets.kitchen3,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 10,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 2000),
                                width: _container2Width,
                                curve: Curves.easeOut,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: kSliderBgColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                child: Stack(
                                  children: [
                                    if (_showText1) ...[
                                      Positioned(
                                        bottom: 15,
                                        top: 7,
                                        left: 10,
                                        // right: 10,
                                        child: FadeTransition(
                                          opacity: _textFadeAnimation,
                                          child: AppText(
                                            'Imota St., 24',
                                            size: 15,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: CircularContainerIcon(
                                        icon: CupertinoIcons.chevron_right,
                                        color: kWhite,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 9),
                      Flexible(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Center(
                                    child: Image.asset(
                                      ImageAssets.kitchen4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 1400),
                                    width: _container3Width,
                                    curve: Curves.easeOut,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: kSliderBgColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    child: Stack(
                                      children: [
                                        if (_showText2) ...[
                                          Positioned(
                                            bottom: 15,
                                            left: 10,
                                            top: 7,
                                            // right: 10,
                                            child: FadeTransition(
                                              opacity: _textFadeAnimation,
                                              child: AppText(
                                                'Princeton St., 27',
                                                size: 15,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CircularContainerIcon(
                                            icon: CupertinoIcons.chevron_right,
                                            color: kWhite,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 9),
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Center(
                                    child: Image.asset(
                                      ImageAssets.kitchen5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 1600),
                                    width: _container4Width,
                                    curve: Curves.easeOut,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: kSliderBgColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                    child: Stack(
                                      children: [
                                        if (_showText3) ...[
                                          Positioned(
                                            bottom: 15,
                                            top: 7,
                                            left: 10,
                                            // right: 10,
                                            child: FadeTransition(
                                              opacity: _textFadeAnimation,
                                              child: AppText(
                                                'Oshodi St., 30',
                                                size: 15,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CircularContainerIcon(
                                            icon: CupertinoIcons.chevron_right,
                                            color: kWhite,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  List<BoxShadow> get _shadow {
    return [
      BoxShadow(
        color: kStrokeBorderColor,
        blurRadius: 16.0,
        offset: const Offset(0, 2),
        spreadRadius: 0,
      ),
    ];
  }

  Widget get _rentInfo {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: Row(
        children: [
          Container(
            width: 180,
            height: 180,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: kAmountContainerColor),
            child: Column(
              children: [
                SizedBox(height: 15),
                AppText("BUY",
                    color: kWhite, size: 16, weight: FontWeight.w500),
                Spacer(),
                AppText("${_numberAnimation.value}",
                    color: kWhite, size: 36, weight: FontWeight.w700),
                AppText("offers",
                    color: kWhite, size: 14, weight: FontWeight.w500),
                SizedBox(height: 15),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: _shadow,
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                AppText("RENT",
                    color: kRentColor, size: 16, weight: FontWeight.w500),
                Spacer(),
                AppText("${_rentAnimaation.value}",
                    color: kRentColor, size: 36, weight: FontWeight.w700),
                AppText("offers",
                    color: kRentColor, size: 14, weight: FontWeight.w500),
                SizedBox(height: 15),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OutwardCurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(
      Offset(30, size.height - 30),
      radius: Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(size.width - 30, size.height - 30);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
