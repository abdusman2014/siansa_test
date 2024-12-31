/*
--------------------------------------------------
                      ROW 1
--------------------------------------------------
    ROW 2 - COLUMN 1    |     ROW 2 - COLUMN 2    
--------------------------------------------------
    ROW 3 - COLUMN 1    |     ROW 3 - COLUMN 2    
--------------------------------------------------
*/

import 'package:flutter/material.dart';

class MyCustomFormLayout2 extends StatelessWidget {
  final Widget? row1Child;
  final Widget? row2Column1Child;
  final Widget? row2Column2Child;
  final Widget? row3Column1Child;
  final Widget? row3Column2Child;

  final bool row1ChildVisible;
  final bool row2Column1ChildVisible;
  final bool row2Column2ChildVisible;
  final bool row3Column1ChildVisible;
  final bool row3Column2ChildVisible;

  const MyCustomFormLayout2({
    Key? key,
    //
    this.row1Child,
    this.row2Column1Child,
    this.row2Column2Child,
    this.row3Column1Child,
    this.row3Column2Child,
    //
    this.row1ChildVisible = true,
    this.row2Column1ChildVisible = true,
    this.row2Column2ChildVisible = true,
    this.row3Column1ChildVisible = true,
    this.row3Column2ChildVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1 with 1 expanded column
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

        const SizedBox(height: 8), // Space between rows

        // Row 2 with responsive layout
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
                  if (row2Column1ChildVisible)
                    const SizedBox(width: 8), // Space between columns

                  // Column 2
                  if (row2Column2ChildVisible)
                    Expanded(
                      child: row2Column2Child ??
                          Container(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16),
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
                  if (row2Column1ChildVisible)
                    row2Column1Child ??
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(16),
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
                  if (row2Column1ChildVisible)
                    const SizedBox(height: 8), // Space between rows

                  // Column 2
                  if (row2Column2ChildVisible)
                    row2Column2Child ??
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(16),
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

        if (row2Column1ChildVisible || row2Column2ChildVisible)
          const SizedBox(height: 8), // Space between rows

        // Row 3 with 1 expanded column
        if (row3Column1ChildVisible || row3Column2ChildVisible)
          Row(
            children: [
              if (row3Column1ChildVisible)
                Expanded(
                  child: row3Column1Child ??
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
              if (row3Column2ChildVisible)
                Expanded(
                  child: row3Column2Child ??
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
