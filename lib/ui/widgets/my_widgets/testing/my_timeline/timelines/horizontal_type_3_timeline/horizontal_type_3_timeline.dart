import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

const months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class HorizontalType3Timeline extends StatefulWidget {
  const HorizontalType3Timeline({super.key});

  @override
  _HorizontalType3TimelineState createState() =>
      _HorizontalType3TimelineState();
}

class _HorizontalType3TimelineState extends State<HorizontalType3Timeline> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int currentMonth = DateTime.now().month;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController!.jumpTo((currentMonth - 1) * 100.0);
    });

    return Container(
      margin: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxHeight: 100),
      decoration: BoxDecoration(
        color: const Color(0xFF35577D).withOpacity(0.5),
        border: Border.all(width: 1, color: const Color(0xFF35577D)),
      ),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: months.length,
        itemBuilder: (BuildContext context, int index) {
          return TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            isFirst: index == 0,
            isLast: index == months.length - 1,
            beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.8)),
            indicatorStyle: IndicatorStyle(
              color: index == currentMonth - 1
                  ? Colors.purpleAccent
                  : Colors.white,
              indicator: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: index == currentMonth - 1
                          ? const Color(0xFF35577D)
                          : Colors.white,
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: index == currentMonth - 1
                      ? const Color(0xFF35577D)
                      : Colors.white,
                ),
              ),
            ),
            endChild: Container(
              constraints: const BoxConstraints(minWidth: 100),
              child: Center(
                child: Text(
                  months[index],
                  style: GoogleFonts.sniglet(
                    fontSize: 18,
                    color: index == currentMonth - 1
                        ? const Color(0xFF35577D)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
