import 'package:fic7_fe/pages/auth/widgets/ap_sign_in.dart';
import 'package:fic7_fe/pages/auth/widgets/ap_sign_up.dart';
import 'package:flutter/material.dart';

class ApTabBody extends StatelessWidget {
  final PageController? pageController;
  final void Function(int)? onPageChanged;
  final bool isLoginPage;
  const ApTabBody({
    Key? key,
    this.pageController,
    this.onPageChanged,
    required this.isLoginPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: 2,
        controller: pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          if (isLoginPage) {
            return const ApSignIn();
          } else {
            return const ApSignUp();
          }
        },
      ),
    );
  }
}
