import 'package:fic7_fe/common/constants/images.dart';
import 'package:flutter/material.dart';

class ApLogo extends StatelessWidget {
  const ApLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.logoWithNameImage,
      height: 150,
      width: 200,
    );
  }
}
