## Required packages

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_showcase/flutter_showcase.dart'; // removed
import 'package:weather_icons/weather_icons.dart'; // needed by weather timeline example

## Import assets

Import assets in the root /assets folder and list them at pubspec.yaml:
    - assets/my_timeline/
    - assets/my_timeline/examples/
    - assets/my_timeline/examples/app/
    - assets/my_timeline/examples/delivery/
    - assets/my_timeline/examples/delivery/horizontal/
    - assets/my_timeline/examples/football/

## See the examples

At path:
my_timeline.dart

Return the next widget:
ExampleTimelines()

Which comes from file path:
example_timelines/example_timelines.dart

From there you, comment/uncomment some widgets to render any of the example timelines:
return ShowcaseTimelineTile();
// return ActivityTimeline();
// return DeliveryTimeline();
// return FootballTimeline();
// return HorizontalTimeline();
// return SuccessTimeline();
// return WeatherTimeline();
