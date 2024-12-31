import 'package:flutter/material.dart';
import 'package:siansa_app/ui/widgets/my_widgets/testing/my_page_slider/my_page_slider.dart';

class CoreCommonExampleMyPageSliderScreen extends StatefulWidget {
  @override
  _CoreCommonExampleMyPageSliderScreenState createState() =>
      _CoreCommonExampleMyPageSliderScreenState();
}

class _CoreCommonExampleMyPageSliderScreenState
    extends State<CoreCommonExampleMyPageSliderScreen> {
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
    // return renderMyPageSlider(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('MyPageSlider Example'),
      // ),
      body: renderMyPageSlider(context),
    );
  }

  Widget renderMyPageSlider(BuildContext context) {
    return MyPageSlider(
      currentPageIndex: _currentIndex,
      widgetsList: [
        Container(
          color: Colors.red,
          child: const Center(
              child: Text(
                  'Page 1 - Slide to the right (Use 2 fingers on desktop)')),
        ),
        Container(
          color: Colors.green,
          child: const Center(
              child: Text(
                  'Page 2 - Slide to the left or right (Use 2 fingers on desktop)')),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
              child: Text(
                  'Page 3 - Slide to the left (Use 2 fingers on desktop)')),
        ),
      ],
      height: 300, // Customize height
      allowManualPageChange: true, // Allow manual page change
    );
  }
}
