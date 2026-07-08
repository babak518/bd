import 'package:flutter/material.dart';

class PolygonPainter extends CustomPainter {
  final List<Offset> vertices;
  final int divisions;

  PolygonPainter(this.vertices, this.divisions);

  @override
  void paint(Canvas canvas, Size size) {
    if (vertices.length < 3) return;

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.blueGrey.shade700;
    final path = Path();
    path.moveTo(vertices.first.dx, vertices.first.dy);
    for (final p in vertices.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, paint);

    final vertexPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.orange.shade700;
    for (final v in vertices) {
      canvas.drawCircle(v, 6, vertexPaint);
    }

    if (divisions <= 1) return;
    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.indigo.shade300;
    for (int i = 0; i < vertices.length; i++) {
      final start = vertices[i];
      final end = vertices[(i + 1) % vertices.length];
      for (int j = 1; j < divisions; j++) {
        final t = j / divisions;
        final dx = start.dx + (end.dx - start.dx) * t;
        final dy = start.dy + (end.dy - start.dy) * t;
        canvas.drawCircle(Offset(dx, dy), 4, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
