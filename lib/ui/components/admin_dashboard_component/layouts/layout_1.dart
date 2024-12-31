import 'package:flutter/material.dart';

class AdminDashboardComponentLayout1 extends StatelessWidget {
  final Widget? row1Child;
  final Widget? row2Column1Child;
  final Widget? row2Column2Child;
  final Widget? row3Child;

  final EdgeInsets childrenPadding;
  final double childrenSpacing;

  const AdminDashboardComponentLayout1({
    Key? key,
    this.row1Child,
    this.row2Column1Child,
    this.row2Column2Child,
    this.row3Child,
    //
    this.childrenPadding = const EdgeInsets.all(0), // 16
    this.childrenSpacing = 0, // 8
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1 with 1 expanded column
        Row(
          children: [
            Expanded(
              child: row1Child ??
                  Container(
                    color: Colors.brown,
                    padding: childrenPadding,
                    child: const Text(
                      'Row 1, Column 1',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
            ),
          ],
        ),

        SizedBox(height: childrenSpacing), // Space between rows

        // Row 2 with responsive layout
        LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  Expanded(
                    child: row2Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: childrenPadding,
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Row 2, Column 1',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Additional Text',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                  ),
                  SizedBox(width: childrenSpacing), // Space between columns

                  // Column 2
                  Expanded(
                    child: row2Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: childrenPadding,
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Row 2, Column 2',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Additional Text',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  // Column 1
                  row2Column1Child ??
                      Container(
                        color: Colors.red,
                        padding: childrenPadding,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Row 2, Column 1',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Additional Text',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                  SizedBox(height: childrenSpacing), // Space between rows

                  // Column 2
                  row2Column2Child ??
                      Container(
                        color: Colors.orange,
                        padding: childrenPadding,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Row 2, Column 2',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Additional Text',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                ],
              );
            }
          },
        ),

        SizedBox(height: childrenSpacing), // Space between rows

        // Row 3 with 1 expanded column
        Row(
          children: [
            Expanded(
              child: row3Child ??
                  Container(
                    color: Colors.blueGrey,
                    padding: childrenPadding,
                    child: const Text(
                      'Row 3, Column 1',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
