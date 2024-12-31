// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_app_bar/my_app_bar.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_page_slider/my_page_slider.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_timeline/my_timeline.dart';

class MyTimelinePages extends StatefulWidget {
  MyTimelinePages({
    Key? key,
    //
    this.titleText = 'My Timeline Pages',
    this.titleWidget = const Text('Text Widget for Title'),
    //
    this.canGoBack = true,
    this.unlockedIndex = 0,
    this.currentIndex = 0,
    this.timelineItems = const [],
    this.timelineItemTitles = const ['Title 1', 'Title 2', 'Title 3'],
    this.pageSliderItems = const [],
    required this.onIndexChanged,
    //
    this.showAppBar = true,
    this.showBottomNavigationBar = true,
    this.showBottomNavigationLeftWidget = true,
    this.showBottomNavigationCenterWidget = true,
    this.showBottomNavigationRightWidget = false,
    this.showBottomNavigationLeftWidgetIfLastIndex = true,
    this.showBottomNavigationCenterWidgetIfLastIndex = true,
    this.showBottomNavigationRightWidgetIfLastIndex = true,
  });

  String titleText;
  Widget titleWidget;
  //
  bool canGoBack; // true if unlockedIndex is >= than the current index
  int unlockedIndex;
  int currentIndex;
  List<Map<String, dynamic>> timelineItems;
  List<String> timelineItemTitles;
  List<Widget> pageSliderItems;
  final Function(int) onIndexChanged;
  //
  final bool showAppBar;
  final bool showBottomNavigationBar;
  final bool showBottomNavigationLeftWidget;
  final bool showBottomNavigationCenterWidget;
  final bool showBottomNavigationRightWidget;
  final bool showBottomNavigationLeftWidgetIfLastIndex;
  final bool showBottomNavigationCenterWidgetIfLastIndex;
  final bool showBottomNavigationRightWidgetIfLastIndex;

  // Child Instances
  // MyPageSlider myPageSlider = MyPageSlider(
  //   // animateToNextPage: 0,
  //   // externalCallableFunction: 0,
  // );
  // MyTimeline myTimeline = MyTimeline();

  @override
  _MyTimelinePagesState createState() => _MyTimelinePagesState();
}

class _MyTimelinePagesState extends State<MyTimelinePages> {
  late List<Map<String, dynamic>> defaultTimelineItems =
      generateDefaultTimelineItems();
  late List<Widget> defaultPageSliderItems = generateDefaultPageSliderItems();

  // Child Instances

  MyPageSlider myPageSlider = MyPageSlider(
      // animateToNextPage: 0,
      // externalCallableFunction: 0,
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyTimelinePages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      print('index from: ${oldWidget.currentIndex} to: ${widget.currentIndex}');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _incrementIndex() {
    if (widget.currentIndex < widget.unlockedIndex &&
        widget.currentIndex < widget.timelineItems.length - 1) {
      setState(() {
        widget.currentIndex++;
        widget.onIndexChanged(widget.currentIndex);
      });
      // myPageSlider.externalCallableFunction(widget.currentIndex);
    }
  }

  void _decrementIndex() {
    if (widget.currentIndex > 0) {
      setState(() {
        widget.currentIndex--;
        widget.onIndexChanged(widget.currentIndex);
      });
      // myPageSlider.externalCallableFunction(widget.currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.timelineItems.isEmpty) {
      setState(() {
        widget.timelineItems = defaultTimelineItems;
      });
    }
    if (widget.pageSliderItems.isEmpty) {
      setState(() {
        widget.pageSliderItems = defaultPageSliderItems;
      });
    }

    return Scaffold(
      appBar: widget.showAppBar
          ? MyAppBar(
              title: 'New Project',
              showLeading: false,
            )
          : null,
      body: Column(
        children: [
          MyTimeline(
            timeline: "horizontal-type-4",
            timelineItemTitles: widget.timelineItemTitles,
            currentIndex: widget.currentIndex,
            bgColor: Colors.transparent,
            doneColor: Colors.green.shade800,
            doingColor: Colors.green.shade400,
            todoColor: Colors.blueGrey.shade200,
            // timelineItemsSeparation: 180.0,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: MyPageSlider(
                // height: 300,
                allowManualPageChange: false,
                currentPageIndex: widget.currentIndex,
                // currentPageIndex: currentIndex,
                widgetsList: widget.pageSliderItems,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          widget.showBottomNavigationBar ? buildBottomBar() : null,
    );
  }

  buildBottomBar() {
    int currentIndexLocalVariable = widget.currentIndex;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.25,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30),
          child: widget.currentIndex > 0 &&
                  widget.showBottomNavigationLeftWidget &&
                  (widget.showBottomNavigationLeftWidgetIfLastIndex == true ||
                      (widget.showBottomNavigationLeftWidgetIfLastIndex ==
                              false &&
                          widget.currentIndex <
                              widget.pageSliderItems.length - 1))
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: widget.currentIndex > 0 ? _decrementIndex : null,
                )
              : const SizedBox(),
        ),
        Container(
          // color: Colors.green,
          width: MediaQuery.of(context).size.width * 0.5,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30),
          child: widget.showBottomNavigationCenterWidget
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${currentIndexLocalVariable + 1} / ${widget.timelineItems.length}',
                      // textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )
              : const SizedBox(),
        ),
        Container(
          // color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.25,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30),
          child: widget.showBottomNavigationRightWidget
              ? IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed:
                      widget.currentIndex < widget.timelineItems.length - 1
                          ? _incrementIndex
                          : null,
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  // DEFAULT DATA

  List<Map<String, dynamic>> generateDefaultTimelineItems() {
    return [
      {"item1": "A"},
      {"item1": "A"},
      {"item1": "A"},
    ];
  }

  List<Widget> generateDefaultPageSliderItems() {
    return [
      Container(
        alignment: Alignment.center,
        color: Colors.red.shade100,
        child: const Text(
          'Page 1',
          style: TextStyle(fontSize: 24),
        ),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.blue.shade100,
        child: const Text(
          'Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.green.shade100,
        child: const Text(
          'Page 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ];
  }
}
