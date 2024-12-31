/*
--------------------------------------------------
                      ROW 1
--------------------------------------------------
    ROW 2 - COLUMN 1    |     ROW 2 - COLUMN 2    
--------------------------------------------------
                      ROW 3
--------------------------------------------------
    ROW 4 - COLUMN 1    |     ROW 4 - COLUMN 2    
--------------------------------------------------
                      ROW 5
--------------------------------------------------
                      ROW 6
--------------------------------------------------
                      ROW 7
--------------------------------------------------
    ROW 8 - COLUMN 1    |     ROW 8 - COLUMN 2    
--------------------------------------------------
                      ROW 9
--------------------------------------------------
    ROW 10 - COLUMN 1    |    ROW 10 - COLUMN 2    
--------------------------------------------------
*/

import 'package:flutter/material.dart';

class MyCustomFormLayout1C extends StatelessWidget {
  final Widget? row1Child;
  final Widget? row2Column1Child;
  final Widget? row2Column2Child;
  final Widget? row3Child;
  final Widget? row4Column1Child;
  final Widget? row4Column2Child;
  final Widget? row5Child;
  final Widget? row6Child;
  final Widget? row7Child;
  final Widget? row8Column1Child;
  final Widget? row8Column2Child;
  final Widget? row9Child;
  final Widget? row10Column1Child;
  final Widget? row10Column2Child;

  final bool row1ChildVisible;
  final bool row2Column1ChildVisible;
  final bool row2Column2ChildVisible;
  final bool row3ChildVisible;
  final bool row4Column1ChildVisible;
  final bool row4Column2ChildVisible;
  final bool row5ChildVisible;
  final bool row6ChildVisible;
  final bool row7ChildVisible;
  final bool row8Column1ChildVisible;
  final bool row8Column2ChildVisible;
  final bool row9ChildVisible;
  final bool row10Column1ChildVisible;
  final bool row10Column2ChildVisible;

  final List<Widget>? row2Column1Widgets;
  final List<Widget>? row2Column2Widgets;
  final List<Widget>? row4Column1Widgets;
  final List<Widget>? row4Column2Widgets;
  final List<Widget>? row8Column1Widgets;
  final List<Widget>? row8Column2Widgets;
  final List<Widget>? row10Column1Widgets;
  final List<Widget>? row10Column2Widgets;

  final double spaceBetweenColumns;

  const MyCustomFormLayout1C({
    Key? key,
    //
    this.row1Child,
    this.row2Column1Child,
    this.row2Column2Child,
    this.row3Child,
    this.row4Column1Child,
    this.row4Column2Child,
    this.row5Child,
    this.row6Child,
    this.row7Child,
    this.row8Column1Child,
    this.row8Column2Child,
    this.row9Child,
    this.row10Column1Child,
    this.row10Column2Child,
    //
    this.row1ChildVisible = true,
    this.row2Column1ChildVisible = true,
    this.row2Column2ChildVisible = true,
    this.row3ChildVisible = true,
    this.row4Column1ChildVisible = true,
    this.row4Column2ChildVisible = true,
    this.row5ChildVisible = true,
    this.row6ChildVisible = true,
    this.row7ChildVisible = true,
    this.row8Column1ChildVisible = true,
    this.row8Column2ChildVisible = true,
    this.row9ChildVisible = true,
    this.row10Column1ChildVisible = true,
    this.row10Column2ChildVisible = true,
    //
    this.row2Column1Widgets,
    this.row2Column2Widgets,
    this.row4Column1Widgets,
    this.row4Column2Widgets,
    this.row8Column1Widgets,
    this.row8Column2Widgets,
    this.row10Column1Widgets,
    this.row10Column2Widgets,
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
                              children: row2Column1Widgets ??
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
                              children: row2Column2Widgets ??
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
                            children: row2Column1Widgets ??
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
                            children: row2Column2Widgets ??
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
                      color: Colors.brown,
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

        if (row3ChildVisible) const SizedBox(height: 8), // Space between rows

        // **************************************************
        // Row 4 with responsive layout (2 Columns)
        // **************************************************

        LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  if (row4Column1ChildVisible)
                    Expanded(
                      child: row4Column1Child ??
                          Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row2Column1Widgets ??
                                  [
                                    const Text(
                                      'Row 4, Column 1',
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
                  if (row4Column1ChildVisible)
                    SizedBox(width: spaceBetweenColumns),

                  // Column 2
                  if (row4Column2ChildVisible)
                    Expanded(
                      child: row4Column2Child ??
                          Container(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row2Column2Widgets ??
                                  [
                                    const Text(
                                      'Row 4, Column 2',
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
                  if (row4Column1ChildVisible)
                    row4Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row2Column1Widgets ??
                                [
                                  const Text(
                                    'Row 4, Column 1',
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
                  // if (row4Column1ChildVisible)
                  //   SizedBox(height: spaceBetweenColumns), // Space between rows

                  // Column 2
                  if (row4Column2ChildVisible)
                    row4Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row2Column2Widgets ??
                                [
                                  const Text(
                                    'Row 4, Column 2',
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

        if (row4Column1ChildVisible || row4Column2ChildVisible)
          SizedBox(height: spaceBetweenColumns), // Space between rows

        // **************************************************
        // Row 5 with 1 expanded column
        // **************************************************

        if (row5ChildVisible)
          Row(
            children: [
              Expanded(
                child: row5Child ??
                    Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Row 5, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            ],
          ),

        // **************************************************
        // Row 6 with 1 expanded column
        // **************************************************

        if (row6ChildVisible)
          Row(
            children: [
              Expanded(
                child: row6Child ??
                    Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Row 6, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            ],
          ),

        // **************************************************
        // Row 7 with 1 expanded column
        // **************************************************

        if (row7ChildVisible)
          Row(
            children: [
              Expanded(
                child: row7Child ??
                    Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Row 7, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            ],
          ),

        // **************************************************
        // Row 8 with responsive layout (2 Columns)
        // **************************************************

        LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  if (row8Column1ChildVisible)
                    Expanded(
                      child: row8Column1Child ??
                          Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row8Column1Widgets ??
                                  [
                                    const Text(
                                      'Row 8, Column 1',
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
                  if (row8Column1ChildVisible)
                    SizedBox(width: spaceBetweenColumns),

                  // Column 2
                  if (row8Column2ChildVisible)
                    Expanded(
                      child: row8Column2Child ??
                          Container(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row8Column2Widgets ??
                                  [
                                    const Text(
                                      'Row 8, Column 2',
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
                  if (row8Column1ChildVisible)
                    row8Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row8Column1Widgets ??
                                [
                                  const Text(
                                    'Row 8, Column 1',
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
                  // if (row8Column1ChildVisible)
                  //   SizedBox(height: spaceBetweenColumns), // Space between rows

                  // Column 2
                  if (row8Column2ChildVisible)
                    row8Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row8Column2Widgets ??
                                [
                                  const Text(
                                    'Row 8, Column 2',
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

        if (row8Column1ChildVisible || row8Column2ChildVisible)
          SizedBox(height: spaceBetweenColumns), // Space between rows

        // **************************************************
        // Row 9 with 1 expanded column
        // **************************************************

        if (row9ChildVisible)
          Row(
            children: [
              Expanded(
                child: row9Child ??
                    Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Row 9, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            ],
          ),

        // **************************************************
        // Row 10 with responsive layout (2 Columns)
        // **************************************************

        LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            if (isTablet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  if (row10Column1ChildVisible)
                    Expanded(
                      child: row10Column1Child ??
                          Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row10Column1Widgets ??
                                  [
                                    const Text(
                                      'Row 10, Column 1',
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
                  if (row10Column1ChildVisible)
                    SizedBox(width: spaceBetweenColumns),

                  // Column 2
                  if (row10Column2ChildVisible)
                    Expanded(
                      child: row10Column2Child ??
                          Container(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: row10Column2Widgets ??
                                  [
                                    const Text(
                                      'Row 10, Column 2',
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
                  if (row10Column1ChildVisible)
                    row10Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row10Column1Widgets ??
                                [
                                  const Text(
                                    'Row 10, Column 1',
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
                  // if (row10Column1ChildVisible)
                  //   SizedBox(height: spaceBetweenColumns), // Space between rows

                  // Column 2
                  if (row10Column2ChildVisible)
                    row10Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: row10Column2Widgets ??
                                [
                                  const Text(
                                    'Row 10, Column 2',
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

        if (row10Column1ChildVisible || row10Column2ChildVisible)
          SizedBox(height: spaceBetweenColumns), // Space between rows

        //
      ],
    );
  }
}
