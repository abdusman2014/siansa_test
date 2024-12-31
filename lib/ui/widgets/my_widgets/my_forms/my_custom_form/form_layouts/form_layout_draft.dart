import 'package:flutter/material.dart';

class MyCustomFormLayoutDraft extends StatelessWidget {
  const MyCustomFormLayoutDraft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1 with 1 fixed column
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.brown,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 2',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 0), // Space between rows

        // Row 1 with 2 fixed columns (not responsive)
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 1',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 2',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 0), // Space between rows

        // Row 2 with responsive layout
        LayoutBuilder(
          builder: (context, constraints) {
            // Check if the screen width is greater than 600px (example breakpoint for tablet)
            bool isTablet = constraints.maxWidth > 600;

            return GridView.count(
              crossAxisCount:
                  isTablet ? 2 : 1, // 2 columns on tablet, 1 on phone
              shrinkWrap:
                  true, // Use shrinkWrap to make GridView fit within Column
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
              children: [
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        'Row 2, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Row 2, Column 1',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.orange,
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        'Row 2, Column 2',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Row 2, Column 2',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 0), // Space between rows

        // Row 1 with 2 fixed columns (not responsive)
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.pink,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 1',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 2',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 0), // Space between rows

        // Row 1 with 1 fixed column
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Row 1, Column 2',
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
