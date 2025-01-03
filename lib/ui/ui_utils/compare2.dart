import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenCustomShape extends StatelessWidget {
  final double width;
  final double height;
  final String workerTitle;
  final String workerSubtitle;
  final String companyTitle;
  final String companySubtitle;

  const SplashScreenCustomShape({
    super.key,
    this.width = 400,
    this.height = 700,
    required this.workerTitle,
    required this.workerSubtitle,
    required this.companyTitle,
    required this.companySubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: MyCustomPainter(width, height, workerTitle, workerSubtitle,
            companyTitle, companySubtitle),
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double width;
  final double height;
  final String workerTitle;
  final String workerSubtitle;
  final String companyTitle;
  final String companySubtitle;

  MyCustomPainter(this.width, this.height, this.workerTitle,
      this.workerSubtitle, this.companyTitle, this.companySubtitle);

  Path createRoundedRectPath(double x, double y) {
    final double rectWidth = width * 0.5;
    final double rectHeight = height * 0.0625;
    const double borderRadius =
        20; // you can adjust this value relative to width and height

    return Path()
      ..moveTo(x + borderRadius, y)
      ..lineTo(x + rectWidth - borderRadius, y)
      ..quadraticBezierTo(x + rectWidth, y, x + rectWidth, y + borderRadius)
      ..lineTo(x + rectWidth, y + rectHeight - borderRadius)
      ..quadraticBezierTo(x + rectWidth, y + rectHeight,
          x + rectWidth - borderRadius, y + rectHeight)
      ..lineTo(x + borderRadius, y + rectHeight)
      ..quadraticBezierTo(x, y + rectHeight, x, y + rectHeight - borderRadius)
      ..lineTo(x, y + borderRadius)
      ..quadraticBezierTo(x, y, x + borderRadius, y)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint bluePaint = Paint()..color = const Color(0xFF1c75bb);
    final Paint orangePaint = Paint()..color = const Color(0xFFf06523);
    const double borderRadius =
        40; // you can adjust this value relative to width and height

    // Draw the blue upper part
    Path bluePath = Path()
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..lineTo(width - borderRadius, 0)
      ..quadraticBezierTo(width, 0, width, borderRadius)
      ..lineTo(width, height * 0.25)
      ..lineTo(0, height * 0.75)
      ..close();
    canvas.drawPath(bluePath, bluePaint);

    // Draw the orange lower part
    Path orangePath = Path()
      ..moveTo(0, height - borderRadius)
      ..quadraticBezierTo(0, height, borderRadius, height)
      ..lineTo(width - borderRadius, height)
      ..quadraticBezierTo(width, height, width, height - borderRadius)
      ..lineTo(width, height * 0.3125)
      ..lineTo(0, height * 0.8125)
      ..lineTo(0, borderRadius)
      ..close();
    canvas.drawPath(orangePath, orangePaint);

    Path workerBg = createRoundedRectPath(width * 0.375, height * 0.4125);
    canvas.drawPath(workerBg, bluePaint);

    Path companyBg = createRoundedRectPath(width * 0.15, height * 0.575);
    canvas.drawPath(companyBg, orangePaint);

    // Adding worker and company text

    // Centered "Worker" text
    final TextPainter workerTextPainter = TextPainter(
      text: TextSpan(
          text: 'Worker',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
            shadows: <Shadow>[
              Shadow(
                offset: const Offset(1.0, 1.0),
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.7),
              ),
            ],
          )),
      textDirection: TextDirection.ltr,
    );
    workerTextPainter.layout();
    final Offset workerTextOffset = Offset(
      width * 0.4 + (width * 0.5 - workerTextPainter.width) / 2,
      height * 0.4125 + (height * 0.0625 - workerTextPainter.height) / 2,
    );
    workerTextPainter.paint(canvas, workerTextOffset);

    // Centered "Company" text
    final TextPainter companyTextPainter = TextPainter(
      text: TextSpan(
          text: 'Company',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
            shadows: <Shadow>[
              Shadow(
                offset: const Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          )),
      textDirection: TextDirection.ltr,
    );
    companyTextPainter.layout();
    final Offset companyTextOffset = Offset(
      width * 0.12 + (width * 0.5 - companyTextPainter.width) / 2,
      height * 0.570 + (height * 0.0625 - companyTextPainter.height) / 2,
    );
    companyTextPainter.paint(canvas, companyTextOffset);

    // Worker title
    _drawText1(workerTitle, canvas, width * 0.4, height * 0.4125);

    // Worker subtitle
    _drawText2(workerSubtitle, canvas, width * 0.4, height * 0.4625);

    // Company title
    _drawText1(companyTitle, canvas, width * 0.12, height * 0.570);

    // Company subtitle
    _drawText2(companySubtitle, canvas, width * 0.12, height * 0.620);
  }

  void _drawText1(String text, Canvas canvas, double x, double y) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          shadows: <Shadow>[
            Shadow(
              offset: const Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final offset = Offset(x, y);
    textPainter.paint(canvas, offset);
  }

  void _drawText2(String text, Canvas canvas, double x, double y) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 21,
          shadows: <Shadow>[
            Shadow(
              offset: const Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final offset = Offset(x, y);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
