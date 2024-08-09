import 'package:flutter/material.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState();
}

abstract class BaseWidgetState extends State<BaseWidget> {
  late Size size;

  @override
  void initState() {
    size = MediaQuery.of(context).size;
    super.initState();
  }
}
