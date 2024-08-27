import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String iconUrl;
  final double? height;
  final Color? color;
  // ignore: use_super_parameters
  const SvgIcon({
    Key? key,
    required this.iconUrl,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconUrl,
      height: height,
      colorFilter: ColorFilter.mode(
        color ?? Colors.black,
        BlendMode.srcIn,
      ),
    );
  }
}
