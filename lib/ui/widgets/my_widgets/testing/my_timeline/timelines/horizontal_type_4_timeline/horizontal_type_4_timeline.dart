import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HorizontalType4Timeline extends StatefulWidget {
  HorizontalType4Timeline({
    Key? key,
    this.currentIndex = 2,
    this.timelineItemTitles = const [
      'Take your phone',
      'Choose a restaurant',
      'Order the food',
      'Wait for delivery',
      'Pay',
      'Eat and enjoy',
    ],
    this.timelineItemImageSources = const [
      'assets/my_timeline/examples/delivery/horizontal/0.png',
      'assets/my_timeline/examples/delivery/horizontal/1.png',
      'assets/my_timeline/examples/delivery/horizontal/2.png',
      'assets/my_timeline/examples/delivery/horizontal/3.png',
      'assets/my_timeline/examples/delivery/horizontal/4.png',
      'assets/my_timeline/examples/delivery/horizontal/5.png',
    ],
    //
    this.bgColor = Colors.transparent, // timeline container background color
    this.doneColor = Colors.green, // done
    this.doingColor = Colors.blue, // doing
    this.todoColor = Colors.red, // todo
    this.timelineItemsSeparation = 0,
  }) : super(key: key);

  //

  final int currentIndex;
  final List<String> timelineItemTitles;
  final List<String> timelineItemImageSources;
  Color bgColor;
  Color doneColor;
  Color doingColor;
  Color todoColor;
  double timelineItemsSeparation;

  @override
  _HorizontalType4TimelineState createState() =>
      _HorizontalType4TimelineState();
}

class _HorizontalType4TimelineState extends State<HorizontalType4Timeline> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  // ************************************************
  // CONTAINER
  // ************************************************

  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.currentIndex;
    double timelineItemsSeparation = widget.timelineItemsSeparation;

    if (timelineItemsSeparation == 0) {
      timelineItemsSeparation =
          MediaQuery.of(context).size.width / widget.timelineItemTitles.length;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _scrollController!.jumpTo(currentIndex * 120.0);
      // _scrollController!.animateTo(
      //   0.5,
      //   duration: const Duration(milliseconds: 250),
      //   curve: Curves.bounceInOut,
      // );
    });

    return Container(
      // margin: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxHeight: 50),
      color: widget.bgColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: widget.timelineItemTitles.length,
        itemBuilder: (BuildContext context, int index) {
          final timelineItemTitle = widget.timelineItemTitles[index];
          var indicatorSize = 35.0;
          var beforeLineStyle = LineStyle(
            // color: Colors.white.withOpacity(0.8),
            // color: widget.beforelineColor,
            color: widget.doneColor,
          );

          _DeliveryStatus status;
          LineStyle? afterLineStyle;
          if (index < currentIndex) {
            status = _DeliveryStatus.done;
          } else if (index > currentIndex) {
            // beforeLineStyle = const LineStyle(color: Color(0xFF747888));
            beforeLineStyle = LineStyle(color: widget.todoColor);
            status = _DeliveryStatus.todo;
            indicatorSize = 30;
          } else {
            // afterLineStyle = const LineStyle(color: Color(0xFF747888));
            afterLineStyle = LineStyle(color: widget.todoColor);
            status = _DeliveryStatus.doing;
          }

          return TimelineTile(
            axis: TimelineAxis.horizontal,
            // alignment: TimelineAlign.manual,
            alignment: TimelineAlign.center,
            lineXY: 0.5,
            isFirst: index == 0,
            isLast: index == widget.timelineItemTitles.length - 1,
            beforeLineStyle: beforeLineStyle,
            afterLineStyle: afterLineStyle,
            indicatorStyle: IndicatorStyle(
              width: indicatorSize,
              height: indicatorSize,
              indicator: _IndicatorDelivery(
                status: status,
                todoColor: widget.todoColor,
                doingColor: widget.doingColor,
                doneColor: widget.doneColor,
              ),
            ),
            startChild: _StartChildDelivery(index: index),
            endChild: _EndChildDelivery(
              text: timelineItemTitle,
              current: index == currentIndex,
              timelineItemsSeparation: timelineItemsSeparation,
            ),
          );
        },
      ),
    );
  }
}

enum _DeliveryStatus { done, doing, todo }

// ************************************************
// START CHILD
// ************************************************

class _StartChildDelivery extends StatelessWidget {
  const _StartChildDelivery({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Center(
        //   child: Image.asset(
        //     'assets/my_timeline/examples/delivery/horizontal/$index.png',
        //     height: 64,
        //   ),
        // ),
        );
  }
}

// ************************************************
// END CHILD
// ************************************************

class _EndChildDelivery extends StatelessWidget {
  const _EndChildDelivery(
      {Key? key,
      @required this.text,
      @required this.current,
      this.timelineItemsSeparation})
      : super(key: key);

  final String? text;
  final bool? current;
  final double? timelineItemsSeparation;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(minWidth: 145),
      constraints: BoxConstraints(minWidth: timelineItemsSeparation!),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flexible(
              //   child: Text(
              //     text!,
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.sniglet(
              //       fontSize: 16,
              //       color: current! ? const Color(0xFF2ACA8E) : Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// ************************************************
// INDICATOR
// ************************************************

class _IndicatorDelivery extends StatelessWidget {
  const _IndicatorDelivery({
    super.key,
    this.status,
    this.doingColor = Colors.blue,
    this.todoColor = Colors.grey,
    this.doneColor = Colors.green,
  });

  final _DeliveryStatus? status;
  final Color doingColor;
  final Color todoColor;
  final Color doneColor;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case _DeliveryStatus.done:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            color: doneColor,
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              // color: Color(0xFF5D6173),
              color: Colors.white,
            ),
          ),
        );
      case _DeliveryStatus.doing:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Color(0xFF2ACA8E),
            color: doingColor,
          ),
          // child: const Center(
          //   child: SizedBox(
          //     height: 15,
          //     width: 15,
          //     child: CircularProgressIndicator(
          //       strokeWidth: 3,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //     ),
          //   ),
          // ),
        );
      case _DeliveryStatus.todo:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Color(0xFF747888),
            color: todoColor,
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Color(0xFF5D6173),
                color: todoColor,
              ),
            ),
          ),
        );
        break;
      case null:
      // TODO: Handle this case.
    }
    return Container();
  }
}
