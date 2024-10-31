import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui'as ui;

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: const GraphArea(),
      ),
    );
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({super.key});

  @override
  State<GraphArea> createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  List<DataPoint> data = List.generate(
    8,
        (index) => DataPoint(day: index + 1, steps: Random().nextInt(100)),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController= AnimationController(vsync: this,duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraphPainter(_animationController.view,data: data), // Pass the actual data here
    );
  }
}

class GraphPainter extends CustomPainter {
  final List<DataPoint> data;

  GraphPainter(Animation animation,{required this.data});

  @override
  void paint(Canvas canvas, Size size) {
      if (data.isEmpty) return; // Handle empty data case

      var xSpacing = size.width / (data.length - 1);
      var maxSteps = data.fold(data[0], (p, c) => p.steps > c.steps ? p : c).steps;

      var yRatio = size.height / maxSteps;
      var curveOffset = xSpacing * 0.3;

      List<Offset> offsets = [];
      var cx = 0.0;

      for (int i = 0; i < data.length; i++) {
        var y = size.height - (data[i].steps * yRatio);
        offsets.add(Offset(cx, y));
        cx += xSpacing;
      }

      Paint linePaint = Paint()
        ..color = Color(0xff30c3f9)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0;

      Paint shadowPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..maskFilter= ui.MaskFilter.blur(ui.BlurStyle.solid, 3)
        ..strokeWidth = 3.0;

      Paint fillPaint = Paint()
        ..shader = ui.Gradient.linear(Offset(size.width/2,0), Offset(size.width/2,size.height), [Color(0xff30c3f9),Colors.white])
        ..style = PaintingStyle.fill
        ..strokeWidth = 3.0;

      Path linePath = Path();
      Offset cOffset = offsets[0];

      linePath.moveTo(cOffset.dx, cOffset.dy);

      for (int i = 1; i < offsets.length; i++) {
        var x = offsets[i].dx;
        var y = offsets[i].dy;
        var c1x = cOffset.dx + curveOffset;
        var c1y = cOffset.dy;
        var c2x = x - curveOffset;
        var c2y = y;

        linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
        cOffset = offsets[i];
      }

      Path fillPath= Path.from(linePath);
      fillPath.lineTo(size.width, size.height);
      fillPath.lineTo(0, size.height);

      canvas.drawPath(fillPath, fillPaint);
      canvas.drawPath(linePath, shadowPaint);
      canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint for now
  }
}

class DataPoint {
  final int day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}