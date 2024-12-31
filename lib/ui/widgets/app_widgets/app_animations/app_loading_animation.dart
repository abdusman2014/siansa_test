import 'package:siansa_app/resources/styles/index.dart';
import 'package:flutter/material.dart';
import '../../my_widgets/my_animation.dart';

// USE:
// AppLoadingAnimation(text: 'Loading'),

class AppLoadingAnimation extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const AppLoadingAnimation({
    super.key,
    this.width = 250,
    this.height = 250,
    this.text = 'Loading...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyAnimation.loadingDots1(size: 250),
          Text(
            text,
            style: ThemeTextStyles.headingThemeTextStyle.apply(
              color: ThemeColors.grey1ThemeColor,
            ),
          )
        ],
      ),
    );
  }
}
