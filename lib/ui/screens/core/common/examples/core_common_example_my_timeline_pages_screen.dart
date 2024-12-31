import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_2.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/combined/my_timeline_pages/my_timeline_pages.dart';

class CoreCommonExampleMyTimelinePagesScreen extends StatefulWidget {
  @override
  _CoreCommonExampleMyTimelinePagesScreenState createState() =>
      _CoreCommonExampleMyTimelinePagesScreenState();
}

class _CoreCommonExampleMyTimelinePagesScreenState
    extends State<CoreCommonExampleMyTimelinePagesScreen> {
  int _currentIndex = 0;

  // Callback when the page index changes
  void _onPageChanged(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
    print('Page index changed to: $newIndex');
  }

  @override
  Widget build(BuildContext context) {
    return renderMyTimelinePages(context, _currentIndex, _onPageChanged);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyTimelinePages Example'),
      ),
      body: renderMyTimelinePages(context, _currentIndex, _onPageChanged),
    );
  }
}

Widget renderMyTimelinePages(
  BuildContext context,
  _currentIndex,
  _onPageChanged,
) {
  return MyTimelinePages(
    titleText: 'Timeline Demo',
    canGoBack: true,
    unlockedIndex: 2, // User can move up to the second page
    currentIndex: _currentIndex,
    timelineItems: const [
      {"title": "Step 1", "content": "This is the first step"},
      {"title": "Step 2", "content": "This is the second step"},
      {"title": "Step 3", "content": "This is the third step"},
    ],
    timelineItemTitles: const ['Step 1', 'Step 2', 'Step 3'],
    pageSliderItems: [
      Container(
        color: Colors.red,
        child: Center(child: Text('Page 1', style: TextStyle(fontSize: 24))),
      ),
      Container(
        color: Colors.green,
        child: Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
      ),
      Container(
        color: Colors.blue,
        child: Center(child: Text('Page 3', style: TextStyle(fontSize: 24))),
      ),
      // SingleChildScrollView(
      //   child: MyCustomFormExample2(
      //     onSubmit: (values) => {print(values)},
      //   ),
      // ),
    ],
    onIndexChanged: _onPageChanged,
    showAppBar: true,
    showBottomNavigationBar: true,
    showBottomNavigationLeftWidget: true,
    showBottomNavigationCenterWidget: true,
    showBottomNavigationRightWidget: true,
  );
}
