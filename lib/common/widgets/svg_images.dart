import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImages extends StatelessWidget {
  final String iconUrl;
  final double? height;
  // ignore: use_super_parameters
  const SvgImages({
    Key? key,
    required this.iconUrl,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconUrl,
      height: height,
    );
  }
}
