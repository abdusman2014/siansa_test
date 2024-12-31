import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'showcase_timeline/showcase_timeline_tile.dart';
import 'activity_timeline/activity_timeline.dart';
import 'delivery_timeline/delivery_timeline.dart';
import 'football_timeline/football_timeline.dart';
import 'horizontal_timeline/horizontal_timeline.dart';
import 'success_timeline/success_timeline.dart';
import 'weather_timeline/weather_timeline.dart';

class ExampleTimelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TIMELINE EXAMPLES:
    return ShowcaseTimelineTile();
    // return ActivityTimeline();
    // return DeliveryTimeline();
    // return FootballTimeline();
    // return HorizontalTimeline();
    // return SuccessTimeline();
    // return WeatherTimeline();

    // Which will build a default tile with a vertical axis,
    // that aligns to the start, with a height of 100:
    // return TimelineTile();

    // The axis can be switched to render an horizontal tile,
    // aligned to the start, with a default width of 100:
    // return TimelineTile(axis: TimelineAxis.horizontal);

    // There are 4 types of alignment.
    // • TimelineAlign.start
    // • TimelineAlign.end
    // • TimelineAlign.center
    // • TimelineAlign.manual

    // The start and end alignment allows a child in their opposite sides.
    // On the other hand, both center and manual allows children on both sides.
    // For example, one tile with alignment to the center:

    // return TimelineTile(
    //   alignment: TimelineAlign.center,
    //   endChild: Container(
    //     constraints: const BoxConstraints(
    //       minHeight: 120,
    //     ),
    //     color: Colors.lightGreenAccent,
    //   ),
    //   startChild: Container(
    //     color: Colors.amberAccent,
    //   ),
    // );

    // When providing children to the vertical tile, the height will be as
    // minimum as possible, so you can control it with a height constraint
    // (at least minHeight). This way the tile knows how to size it properly.

    // If the axis is horizontal, the things are the opposite. The width will
    // be as minimum as possible, so you can control it with a width constraint
    // (at least minWidth). This way the tile knows how to size it properly.

    // return TimelineTile(
    //   axis: TimelineAxis.horizontal,
    //   alignment: TimelineAlign.center,
    //   endChild: Container(
    //     constraints: const BoxConstraints(
    //       minWidth: 120,
    //     ),
    //     color: Colors.lightGreenAccent,
    //   ),
    //   startChild: Container(
    //     color: Colors.amberAccent,
    //   ),
    // );

    // Manual aligning the idicator #

    // With TimelineAlign.manual you can provide the lineXY, which allows you to
    // specify a value from 0.0 to 1.0, that represents a size percentage.
    // For example, aligning at 30% of the width or height:

    // return TimelineTile(
    //   alignment: TimelineAlign.manual,
    //   lineXY: 0.3,
    //   endChild: Container(
    //     constraints: const BoxConstraints(
    //       minHeight: 120,
    //     ),
    //     color: Colors.lightGreenAccent,
    //   ),
    //   startChild: Container(
    //     color: Colors.amberAccent,
    //   ),
    // );

    // return TimelineTile(
    //   axis: TimelineAxis.horizontal,
    //   alignment: TimelineAlign.manual,
    //   lineXY: 0.3,
    //   endChild: Container(
    //     constraints: const BoxConstraints(
    //       minWidth: 120,
    //     ),
    //     color: Colors.lightGreenAccent,
    //   ),
    //   startChild: Container(
    //     color: Colors.amberAccent,
    //   ),
    // );

    // Is it the first or the last?

    // You can decide if a tile is the first os the last in a timeline.
    // This way you control whether a before or after line must be rendered.
  }
}
