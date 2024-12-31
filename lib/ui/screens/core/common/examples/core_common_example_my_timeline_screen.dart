import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_timeline/my_timeline.dart';

// Define the items for the timeline
final List<Map<String, dynamic>> timelineItems = [
  {
    'title': 'Step 1',
    'description': 'This is the first step',
    'itemIcon': Icons.check_circle,
    'actionType': 'navigate',
    'navigateToRoute': '/step1',
    'attachments': ['Attachment 1'],
    'comments': ['Comment 1'],
  },
  {
    'title': 'Step 2',
    'description': 'This is the second step',
    'itemIcon': Icons.access_time,
    'actionType': 'navigate',
    'navigateToRoute': '/step2',
    'attachments': ['Attachment 2'],
    'comments': ['Comment 2'],
  },
  {
    'title': 'Step 3',
    'description': 'This is the third step',
    'itemIcon': Icons.done,
    'actionType': 'navigate',
    'navigateToRoute': '/step3',
    'attachments': ['Attachment 3'],
    'comments': ['Comment 3'],
  },
];

class CoreCommonExampleMyTimelineScreen extends StatefulWidget {
  @override
  _CoreCommonExampleMyTimelineScreenState createState() =>
      _CoreCommonExampleMyTimelineScreenState();
}

class _CoreCommonExampleMyTimelineScreenState
    extends State<CoreCommonExampleMyTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return renderMyTimeline(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Timeline Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: renderMyTimeline(context),
      ),
    );
  }
}

Widget renderMyTimeline(BuildContext context) {
  return MyTimeline(
    timeline: 'horizontal-type-1', // Choose the timeline type
    currentIndex: 1, // Set the current active index
    timelineItemTitles:
        timelineItems.map((item) => item['title'] as String).toList(),
    timelineItemDescriptions:
        timelineItems.map((item) => item['description'] as String).toList(),
    timelineItemIcons:
        timelineItems.map((item) => item['itemIcon'] as IconData).toList(),
    timelineItemActionTypes:
        timelineItems.map((item) => item['actionType'] as String).toList(),
    timelineItemNavigationRoutes:
        timelineItems.map((item) => item['navigateToRoute'] as String).toList(),
    timelineItemAttachments:
        timelineItems.map((item) => item['attachments'] as dynamic).toList(),
    timelineItemComments:
        timelineItems.map((item) => item['comments'] as dynamic).toList(),
    doneColor: Colors.green, // Customize colors
    doingColor: Colors.blue,
    todoColor: Colors.grey,
    timelineItemsSeparation: 10.0, // Customize item separation
  );
}
