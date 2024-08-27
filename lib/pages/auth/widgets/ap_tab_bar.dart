// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fic7_fe/common/constants/custom_theme.dart';

class ApTabBar extends StatelessWidget {
  final bool isLoginPage;
  final void Function()? onTap;
  final String text;
  const ApTabBar({
    super.key,
    this.onTap,
    required this.isLoginPage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: isLoginPage ? titilliumSemiBold : titilliumRegular,
          ),
          Container(
            height: 1,
            width: 40,
            margin: const EdgeInsets.only(top: 8),
            color: isLoginPage
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
