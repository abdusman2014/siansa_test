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
//      titleImageSource,
//      description,
//      descriptionIcon,
//      descriptionImageSource,
//      itemIcon,
//      itemImageSources,
//      actionType, // that happens on click item/tile
//      navigateToRoute, // string of the route to navigate on clicking item
//      attachments
//      comments

// "horizontal", "horizontal-interactive", "vertical", "vertical-interactive"

class MyTimeline extends StatefulWidget {
  MyTimeline({
    //
    Key? key,
    this.timeline = "horizontal-type-1",
    this.currentIndex = 0,
    //
    this.timelineItems = const [],
    //
    this.timelineItemTitles = const [],
    this.timelineItemTitleIcons = const [],
    this.timelineItemTitleImageSources = const [],
    this.timelineItemDescriptions = const [],
    this.timelineItemDescriptionIcons = const [],
    this.timelineItemDescriptionImageSources = const [],
    this.timelineItemIcons = const [],
    this.timelineItemImageSources = const [],
    this.timelineItemActionTypes = const [],
    this.timelineItemNavigationRoutes = const [],
    this.timelineItemAttachments = const [],
    this.timelineItemComments = const [],
    //
    this.style = "", // "style-1"
    this.bgColor = Colors.transparent,
    this.doneColor = Colors.green,
    this.doingColor = Colors.blue,
    this.todoColor = Colors.red,
    this.timelineItemsSeparation = 0,
  }) : super(key: key);

  final String timeline;
  int currentIndex;

  final List<dynamic> timelineItems;

  final List<String> timelineItemTitles;
  final List<dynamic> timelineItemTitleIcons;
  final List<String> timelineItemTitleImageSources;
  final List<String> timelineItemDescriptions;
  final List<dynamic> timelineItemDescriptionIcons;
  final List<String> timelineItemDescriptionImageSources;
  final List<dynamic> timelineItemIcons;
  final List<String> timelineItemImageSources;
  final List<String> timelineItemActionTypes;
  final List<String> timelineItemNavigationRoutes;
  final List<dynamic> timelineItemAttachments;
  final List<dynamic> timelineItemComments;

  final String style;
  final Color bgColor;
  final Color doneColor;
  final Color doingColor;
  final Color todoColor;
  final double timelineItemsSeparation;

  @override
  _MyTimelineState createState() => _MyTimelineState();
}

class _MyTimelineState extends State<MyTimeline> {
  @override
  Widget build(BuildContext context) {
    // return Expanded(child: ExampleTimelines());

    var timeline = widget.timeline;
    var currentIndex = widget.currentIndex;
    var timelineItems = widget.timelineItems;
    var timelineItemTitles = widget.timelineItemTitles;
    var style = widget.style;
    var bgColor = widget.bgColor;
    var doneColor = widget.doneColor;
    var doingColor = widget.doingColor;
    var todoColor = widget.todoColor;
    var timelineItemsSeparation = widget.timelineItemsSeparation;

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
        timelineItemTitles: timelineItemTitles,
        currentIndex: currentIndex,
        bgColor: bgColor,
        doneColor: doneColor,
        doingColor: doingColor,
        todoColor: todoColor,
        timelineItemsSeparation: timelineItemsSeparation,
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
