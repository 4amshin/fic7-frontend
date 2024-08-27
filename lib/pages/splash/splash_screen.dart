import 'package:fic7_fe/common/constants/colors.dart';
import 'package:fic7_fe/common/constants/images.dart';
import 'package:fic7_fe/pages/splash/widgets/splash_painter.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
// ignore: use_super_parameters
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          //Custom Background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorResources.getPrimary(context),
            child: CustomPaint(
              painter: SplashPainter(),
            ),
          ),
          //Logo
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Images.splashLogo,
                  height: 250,
                  fit: BoxFit.scaleDown,
                  width: 250,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
