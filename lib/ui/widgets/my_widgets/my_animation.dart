// EXAMPLE USAGE:
// MyAnimation.circlePulseBlue()
// or with options:
// MyAnimation.circlePulseBlue(size: 300, repeat: true)

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:siansa_app/resources/animation_assets.dart';

class MyAnimation extends StatelessWidget {
  final String animAssetPath;
  final double size;
  final bool repeat;
  final bool reverse;

  const MyAnimation({
    super.key,
    required this.animAssetPath,
    this.size = 150,
    this.repeat = false,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animAssetPath,
      width: size,
      height: size,
      repeat: repeat,
      reverse: reverse,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }

  // Private static method to avoid duplication
  static MyAnimation _createAnimation(String animAssetPath,
      {double size = 150, bool repeat = false, bool reverse = false}) {
    return MyAnimation(
      animAssetPath: animAssetPath,
      size: size,
      repeat: repeat,
      reverse: reverse,
    );
  }

  // Static getters for each animation, using dot notation
  static MyAnimation blueOrangeLoadingDots(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.blueOrangeLoadingDots,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation loadingDots1(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.loadingDots1,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation loadingDots2(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.loadingDots2,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation loadingDots3(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.loadingDots3,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation loadingCircleLightBlue(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.loadingCircleLightBlue,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation loadingCircleBlue(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.loadingCircleBlue,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation circleCheckmarkBlue(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.circleCheckmarkBlue,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation congratulationsCup(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.congratulationsCup,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation greenCheckmark(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.greenCheckmark,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation congratulationsConfetti(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.congratulationsConfetti,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation congratulationsConfettiBlue(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.congratulationsConfettiBlue,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation congratulationsConfettiBlue2(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.congratulationsConfettiBlue2,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation circlePulseBlue(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.circlePulseBlue,
          size: size, repeat: repeat, reverse: reverse);

  static MyAnimation circlePulseBlue2(
          {double size = 150, bool repeat = false, bool reverse = false}) =>
      _createAnimation(AnimationAssets.circlePulseBlue2,
          size: size, repeat: repeat, reverse: reverse);
}
