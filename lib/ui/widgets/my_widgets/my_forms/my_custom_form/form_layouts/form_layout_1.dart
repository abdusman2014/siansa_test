/*
--------------------------------------------------
                      ROW 1
--------------------------------------------------
    ROW 2 - COLUMN 1    |     ROW 2 - COLUMN 2    
--------------------------------------------------
                      ROW 3
--------------------------------------------------
*/

import 'package:flutter/material.dart';

class MyCustomFormLayout1 extends StatelessWidget {
  final Widget? row1Child;
  final Widget? row2Column1Child;
  final Widget? row2Column2Child;
  final Widget? row3Child;

  final bool row1ChildVisible;
  final bool row2Column1ChildVisible;
  final bool row2Column2ChildVisible;
  final bool row3ChildVisible;

  final List<Widget>? column1Widgets;
  final List<Widget>? column2Widgets;

  final double spaceBetweenColumns;

  const MyCustomFormLayout1({
    Key? key,
    //
    this.row1Child,
    this.row2Column1Child,
    this.row2Column2Child,
    this.row3Child,
    //
    this.row1ChildVisible = true,
    this.row2Column1ChildVisible = true,
    this.row2Column2ChildVisible = true,
    this.row3ChildVisible = true,
    //
    this.column1Widgets,
    this.column2Widgets,
    //
    this.spaceBetweenColumns = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // **************************************************
        // Row 1 with 1 expanded column
        // **************************************************

        if (row1ChildVisible)
          Row(
            children: [
              Expanded(
                child: row1Child ??
                    Container(
                      color: Colors.brown,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Row 1, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            ],
          ),

        if (row1ChildVisible) const SizedBox(height: 8), // Space between rows

        // **************************************************
        // Row 2 with responsive layout (2 Columns)
        // **************************************************

        LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  if (row2Column1ChildVisible)
                    Expanded(
                      child: row2Column1Child ??
                          Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: column1Widgets ??
                                  [
                                    const Text(
                                      'Row 2, Column 1',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
                                      'Additional Text',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                            ),
                          ),
                    ),
                  if (row2Column1ChildVisible)
                    SizedBox(width: spaceBetweenColumns),

                  // Column 2
                  if (row2Column2ChildVisible)
                    Expanded(
                      child: row2Column2Child ??
                          Container(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: column2Widgets ??
                                  [
                                    const Text(
                                      'Row 2, Column 2',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
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
                  if (row2Column1ChildVisible)
                    row2Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: column1Widgets ??
                                [
                                  const Text(
                                    'Row 2, Column 1',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'Additional Text',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                          ),
                        ),
                  // if (row2Column1ChildVisible)
                  //   SizedBox(height: spaceBetweenColumns), // Space between rows

                  // Column 2
                  if (row2Column2ChildVisible)
                    row2Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: column2Widgets ??
                                [
                                  const Text(
                                    'Row 2, Column 2',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
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

        if (row2Column1ChildVisible || row2Column2ChildVisible)
          SizedBox(height: spaceBetweenColumns), // Space between rows

        // **************************************************
        // Row 3 with 1 expanded column
        // **************************************************

        if (row3ChildVisible)
          Row(
            children: [
              Expanded(
                child: row3Child ??
                    Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(16),
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
