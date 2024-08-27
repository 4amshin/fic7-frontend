import 'package:fic7_fe/common/constants/colors.dart';
import 'package:fic7_fe/common/constants/dimension.dart';
import 'package:flutter/material.dart';

class ApUnderline extends StatelessWidget {
  const ApUnderline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: Dimensions.marginSizeExtraSmall,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: ColorResources.getGainsBoro(context),
      ),
    );
  }
}
