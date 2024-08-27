import 'package:fic7_fe/common/constants/dimension.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_background.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_logo.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_tab_bar.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_tab_body.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_underline.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final int initialPage;
  const AuthPage({
    super.key,
    this.initialPage = 0,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoginPage = true;
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: widget.initialPage);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const ApBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: Dimensions.topSpace),
                const ApLogo(),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.marginSizeLarge),
                  child: Stack(
                    children: [
                      const ApUnderline(),
                      Row(
                        children: [
                          ApTabBar(
                            onTap: () => pageController.animateToPage(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            ),
                            isLoginPage: isLoginPage,
                            text: 'SignIn',
                          ),
                          const SizedBox(
                              width: Dimensions.paddingSizeExtraLarge),
                          ApTabBar(
                            onTap: () => pageController.animateToPage(
                              1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            ),
                            isLoginPage: !isLoginPage,
                            text: 'SignOut',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ApTabBody(
                  isLoginPage: isLoginPage,
                  pageController: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      isLoginPage = !isLoginPage;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
