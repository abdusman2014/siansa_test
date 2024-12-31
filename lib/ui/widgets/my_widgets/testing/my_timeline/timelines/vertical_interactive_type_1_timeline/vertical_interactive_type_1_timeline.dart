// This was timeline-tile, but should timeline
// VerticalInteractiveType1TimelineTile to VerticalInteractiveType1Timeline
// vertical_interactive_type_1_timeline_tile to vertical_interactive_type_1_timeline

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'vertical_interactive_type_1_timeline_tile.dart';

class VerticalInteractiveType1Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF004E92),
              Color(0xFF000428),
            ],
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  const Text(
                    'TimelineTile Showcase HEHE',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: examples.length,
                      itemBuilder: (BuildContext context, int index) {
                        final example = examples[index];

                        return TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.1,
                          isFirst: index == 0,
                          isLast: index == examples.length - 1,
                          indicatorStyle: IndicatorStyle(
                            width: 40,
                            height: 40,
                            indicator:
                                _IndicatorExample(number: '${index + 1}'),
                            drawGap: true,
                          ),
                          beforeLineStyle: LineStyle(
                            color: Colors.white.withOpacity(0.2),
                          ),
                          endChild: GestureDetector(
                            child: _RowExample(example: example),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<
                                    VerticalInteractiveType1TimelineTile>(
                                  builder: (_) =>
                                      VerticalInteractiveType1TimelineTile(
                                          example: example),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key, required this.example}) : super(key: key);

  final Example example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              example.name,
              style: GoogleFonts.jura(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}

// return TimelineTile(
//       alignment: TimelineAlign.center,
//       endChild: Container(
//         constraints: const BoxConstraints(
//           minHeight: 120,
//         ),
//         color: Colors.lightGreenAccent,
//       ),
//       startChild: Container(
//         color: Colors.amberAccent,
//       ),
//     );