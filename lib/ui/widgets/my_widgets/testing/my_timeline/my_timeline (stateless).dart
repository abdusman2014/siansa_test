import 'package:flutter/material.dart';
import 'example_timelines/example_timelines.dart';
import 'timelines/index.dart';
import 'timelines/vertical_interactive_type_1_timeline/vertical_interactive_type_1_timeline.dart';

// *** TIMELINE CONFIGURATION & PARAMETERS: ***
// timeline type
// show timeline header? Includes: back button, title, and right button for extra actions.
// timeline active index or current step, active item
// timeline list of items/tiles
//    each item must contain:
//      title,
//      titleIcon,
//      titleImage,
//      description,
//      descriptionIcon,
//      descriptionImage,
//      itemIcon,
//      itemImage,
//      action, // that happens on click item/tile

// "horizontal", "horizontal-interactive", "vertical", "vertical-interactive"

class MyTimeline extends StatelessWidget {
  const MyTimeline({
    super.key,
    this.timeline = "horizontal-type-1",
    this.style = "", // "style-1"
    this.activeIndex = 0,
    this.stepsText = const [],
    this.stepsImgSrc = const [],
    //
    // USED BY THE NEXT TIMELINES:
    // "horizontal-type-4"
    this.bgColor = Colors.transparent,
    this.doingColor = Colors.blue,
    this.doneColor = Colors.green,
    this.todoColor = Colors.red,
  });

  final String timeline;
  final String style;
  final int activeIndex;
  final List<dynamic> stepsText;
  final List<dynamic> stepsImgSrc;

  final Color bgColor;
  final Color doingColor;
  final Color doneColor;
  final Color todoColor;

  @override
  Widget build(BuildContext context) {
    // return Expanded(child: ExampleTimelines());

    if (timeline.toString() == "horizontal-interactive-type-1") {
      return const HorizontalInteractiveType1Timeline();
    }

    if (timeline.toString() == "horizontal-type-1") {
      return const HorizontalType1Timeline();
    }
    if (timeline.toString() == "horizontal-type-2") {
      return const HorizontalType2Timeline();
    }
    if (timeline.toString() == "horizontal-type-3") {
      return const HorizontalType3Timeline();
    }
    if (timeline.toString() == "horizontal-type-4") {
      return HorizontalType4Timeline(
        bgColor: bgColor,
        doingColor: doingColor,
        doneColor: doneColor,
        todoColor: todoColor,
      );
    }

    if (timeline.toString() == "vertical-interactive-type-1") {
      return VerticalInteractiveType1Timeline();
    }

    if (timeline.toString() == "vertical-type-1") {
      return VerticalType1Timeline();
    }
    if (timeline.toString() == "vertical-type-2") {
      return VerticalType2Timeline();
    }
    if (timeline.toString() == "vertical-type-3") {
      return VerticalType3Timeline();
    }
    if (timeline.toString() == "vertical-type-4") {
      return VerticalType4Timeline();
    }
    if (timeline.toString() == "vertical-type-5") {
      return VerticalType5Timeline();
    }

    return Text(
      'my_timeline.dart MyTimeline() error: The timeline name "$timeline" does not exist. Please set an existing timeline.',
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
