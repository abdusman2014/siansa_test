import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

const appSteps = [
  'Configure',
  'Code',
  'Test',
  'Deploy',
  'Scale',
];

class HorizontalType2Timeline extends StatelessWidget {
  const HorizontalType2Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    const currentStep = 1;

    return Container(
      margin: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxHeight: 120),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appSteps.length,
        itemBuilder: (BuildContext context, int index) {
          var beforeLineStyle = const LineStyle(
            thickness: 20,
            color: Color(0xFFD4D4D4),
          );

          LineStyle? afterLineStyle;
          if (index <= currentStep) {
            beforeLineStyle = const LineStyle(
              thickness: 20,
              color: Color(0xFF9F92E2),
            );
          }

          if (index == currentStep) {
            afterLineStyle = const LineStyle(
              thickness: 20,
              color: Color(0xFFD4D4D4),
            );
          }

          final isFirst = index == 0;
          final isLast = index == appSteps.length - 1;
          var indicatorX = 0.5;
          if (isFirst) {
            indicatorX = 0.3;
          } else if (isLast) {
            indicatorX = 0.7;
          }

          return TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.manual,
            lineXY: 0.8,
            isFirst: isFirst,
            isLast: isLast,
            beforeLineStyle: beforeLineStyle,
            afterLineStyle: afterLineStyle,
            hasIndicator: index <= currentStep || isLast,
            indicatorStyle: IndicatorStyle(
              width: 20,
              height: 20,
              indicatorXY: indicatorX,
              color: const Color(0xFFD4D4D4),
              indicator: index <= currentStep ? const _IndicatorApp() : null,
            ),
            startChild: Container(
              constraints: const BoxConstraints(minWidth: 120),
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/my_timeline/examples/app/$index.png',
                      height: 40),
                  const SizedBox(width: 8),
                  Text(
                    appSteps[index],
                    style: GoogleFonts.sniglet(
                      fontSize: 14,
                      color: index <= currentStep
                          ? const Color(0xFF9F92E2)
                          : const Color(0xFFD4D4D4),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _IndicatorApp extends StatelessWidget {
  const _IndicatorApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9F92E2),
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
