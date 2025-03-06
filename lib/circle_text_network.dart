import 'package:beems/contact_us.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:js' as js;

class CircleNetworkWidget extends StatelessWidget {
  const CircleNetworkWidget({super.key});

  static const List<Map<String, String>> companyData = [
    {"name": "New India Assurance", "image": "assets/images/new_india_assurance_company.jpg"},
    {"name": "Chola MS GIC Ltd", "image": "assets/images/chola_ms.png"},
    {"name": "Tata AIG GIC Ltd", "image": "assets/images/tata_aig.jpg"},
    {"name": "STAR Health Insurance", "image": "assets/images/star_health.png"},
    {"name": "Reliance GIC Ltd", "image": "assets/images/releance.jpg"},
    {"name": "SBI GIC Ltd", "image": "assets/images/sbi.png"},
    {"name": "Rayal Sundaram GIC Ltd", "image": "assets/images/rayal_sundaram.jpg"},
    {"name": "Oriental Insurance", "image": "assets/images/oriental.png"},
    {"name": "Shriram GIC Ltd", "image": "assets/images/sriram.jpg"},
    {"name": "ICICI Lombard GIC Ltd", "image": "assets/images/icici.jpg"},
    {"name": "National Insurance", "image": "assets/images/national.jpg"},
    {"name": "Digit Insurance", "image": "assets/images/digit.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 500,
        child: Stack(
          children: [
            // Background circle and lines
            CustomPaint(
              size: const Size(500, 500),
              painter: CircleNetworkPainter(companyData.length),
            ),
            // Overlay images and text
            ..._buildCompanyWidgets(context),
            _buildCenterText(),
          ],
        ),
      ),
    );
  }

  // Positioning company images and names
  List<Widget> _buildCompanyWidgets(BuildContext context) {
    final double centerX = 250;
    final double centerY = 250;
    final double radius = 200;
    final double smallRadius = 50;

    List<Widget> widgets = [];

    for (int i = 0; i < companyData.length; i++) {
      double angle = (2 * pi / companyData.length) * i;
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);

      widgets.add(
        Positioned(
          left: x - smallRadius,
          top: y - smallRadius,
          child: ClipOval(
            child: GestureDetector(
              onTap: (){
                final String secretKey = js.context['ENV_SECRET_KEY'] ?? 'default_value';

                print("secretKey1 $secretKey");
                showDialog(context: context, builder: (BuildContext ctx){

                  return AlertDialog(
                    content: ContactUs(type:'popup'),
                  );
                });
              },
              child: Image.asset(
                companyData[i]["image"]!,
                width: smallRadius * 2,
                height: smallRadius * 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
  // Center text inside the main circle
  Widget _buildCenterText() {
    return Positioned(
      left: 210,
      top: 230,
      child: Column(
        children: const [
          Text(
            "BEEM REDDY \nINSURANCE",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            "AGENCY",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CircleNetworkPainter extends CustomPainter {
  final int companyCount;
  CircleNetworkPainter(this.companyCount);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint dottedLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = 200;
    final double smallRadius = 50;

    // Draw center circle
    canvas.drawCircle(Offset(centerX, centerY), smallRadius, Paint()..color = Colors.blue);

    for (int i = 0; i < companyCount; i++) {
      double angle = (2 * pi / companyCount) * i;
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);

      double lineStartX = centerX + (smallRadius - 5) * cos(angle);
      double lineStartY = centerY + (smallRadius - 5) * sin(angle);

      // Draw dotted line from center to outer circles
      _drawDottedLine(canvas, Offset(lineStartX, lineStartY), Offset(x, y), dottedLinePaint);

      // Draw outer circles
      canvas.drawCircle(Offset(x, y), smallRadius, Paint()..color = Colors.orange);
    }
  }

  // Function to draw a dotted line
  void _drawDottedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const double dashWidth = 5, dashSpace = 3;
    double distance = (end - start).distance;
    double dashCount = (distance / (dashWidth + dashSpace)).floorToDouble();
    double dx = (end.dx - start.dx) / dashCount;
    double dy = (end.dy - start.dy) / dashCount;

    for (int i = 0; i < dashCount; i++) {
      if (i % 2 == 0) {
        canvas.drawLine(
          Offset(start.dx + dx * i, start.dy + dy * i),
          Offset(start.dx + dx * (i + 1), start.dy + dy * (i + 1)),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
