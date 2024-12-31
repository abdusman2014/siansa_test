import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'timelines/index.dart';

class HorizontalTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HorizontalTimeline();
  }
}

class _HorizontalTimeline extends StatefulWidget {
  @override
  _HorizontalTimelineState createState() => _HorizontalTimelineState();
}

class _HorizontalTimelineState extends State<_HorizontalTimeline> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8F8F8),
            Colors.white,
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            // accentColor: const Color(0xFF35577D).withOpacity(0.2),
            ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  Text(
                    'Horizontal Timelines',
                    style: GoogleFonts.sniglet(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverPadding(padding: EdgeInsets.only(top: 20)),
                        SliverToBoxAdapter(
                          child: _MessageTimeline(message: 'Months timeline:'),
                        ),
                        TimelineMonths(),
                        SliverPadding(padding: EdgeInsets.only(top: 20)),
                        SliverToBoxAdapter(
                          child: _MessageTimeline(message: 'App timeline:'),
                        ),
                        AppTimeline(),
                        SliverPadding(padding: EdgeInsets.only(top: 20)),
                        SliverToBoxAdapter(
                          child:
                              _MessageTimeline(message: 'Delivery timeline:'),
                        ),
                        SliverPadding(padding: EdgeInsets.only(top: 20)),
                        DeliveryTimeline(),
                        SliverPadding(padding: EdgeInsets.only(top: 60)),
                      ],
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

class _MessageTimeline extends StatelessWidget {
  const _MessageTimeline({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: GoogleFonts.sniglet(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
