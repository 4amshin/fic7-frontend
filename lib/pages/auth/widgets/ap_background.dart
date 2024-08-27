import 'package:fic7_fe/common/constants/images.dart';
import 'package:flutter/material.dart';

class ApBackground extends StatelessWidget {
  const ApBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.background,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
