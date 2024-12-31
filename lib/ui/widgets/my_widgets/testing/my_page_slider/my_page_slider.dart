import 'package:flutter/material.dart';

class MyPageSlider extends StatefulWidget {
  int currentPageIndex;
  List<Widget> widgetsList;
  double? height;
  bool allowManualPageChange;

  MyPageSlider({
    Key? key,
    this.currentPageIndex = 0,
    this.widgetsList = const [],
    this.height, // does not work if MyPageSlider() is a child of Expanded()
    this.allowManualPageChange = true,
  }) : super(key: key);

  // void externalCallableFunction(int index) {
  //   print("externalCallableFunction: $index");
  // }

  @override
  _MyPageSliderState createState() => _MyPageSliderState();
}

class _MyPageSliderState extends State<MyPageSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.currentPageIndex,
    );
  }

  @override
  void didUpdateWidget(covariant MyPageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPageIndex != widget.currentPageIndex) {
      animateToPage(widget.currentPageIndex);
    }
  }

  void animateToPage(int index) {
    // if (index > 0 && index < widget.widgetsList.length) {
    if (index < widget.widgetsList.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double defaultHeight = MediaQuery.of(context).size.height * 0.7;
    final double height = widget.height ?? defaultHeight;

    late int _currPageIndex = widget.currentPageIndex;
    if (_currPageIndex != widget.currentPageIndex) {
      animateToPage(widget.currentPageIndex);
      _currPageIndex = widget.currentPageIndex;
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // child: Column(
      //   children: [
      //     // buildTestButton(),
      //     // buildTestText(),
      //     SizedBox(
      //       height: height,
      //       child: PageView.builder(
      //         controller: _pageController,
      //         // physics: const AlwaysScrollableScrollPhysics(),
      //         physics: widget.allowManualPageChange
      //             // Set physics based on parameter
      //             ? const AlwaysScrollableScrollPhysics()
      //             // Disable manual page change if set to false
      //             : const NeverScrollableScrollPhysics(),
      //         itemCount: widget.widgetsList.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return buildPages(context, widget.widgetsList, index);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      //
      // ===> wrap it on an Expanded() => Container => PageView.builder() from parent widget()
      child: PageView.builder(
        controller: _pageController,
        // physics: const AlwaysScrollableScrollPhysics(),
        physics: widget.allowManualPageChange
            // Set physics based on parameter
            ? const AlwaysScrollableScrollPhysics()
            // Disable manual page change if set to false
            : const NeverScrollableScrollPhysics(),
        itemCount: widget.widgetsList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildPages(context, widget.widgetsList, index);
        },
      ),
      //
      // child: Expanded(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width * 1,
      //     color: Colors.red,
      //     // child: Text('HEY'),
      //     child: PageView.builder(
      //       controller: _pageController,
      //       // physics: const AlwaysScrollableScrollPhysics(),
      //       physics: widget.allowManualPageChange
      //           // Set physics based on parameter
      //           ? const AlwaysScrollableScrollPhysics()
      //           // Disable manual page change if set to false
      //           : const NeverScrollableScrollPhysics(),
      //       itemCount: widget.widgetsList.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return buildPages(context, widget.widgetsList, index);
      //       },
      //     ),
      //   ),
      // ),
      //
    );
  }

  Widget buildPages(BuildContext context, widgetsList, index) {
    return widgetsList[index];
  }

  buildTestButton() {
    return TextButton(
      onPressed: () {
        animateToPage(widget.currentPageIndex);
      },
      child: Text(
        "INDEX: " + widget.currentPageIndex.toString(),
      ),
    );
  }

  buildTestText() {
    return Text("INDEX: " + widget.currentPageIndex.toString());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
