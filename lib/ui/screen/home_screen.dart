import 'package:flutter/material.dart';
import 'package:bd/config/constants.dart';
import 'package:bd/core/geometry/polygon_points.dart';
import 'package:bd/ui/painters/polygon_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sides = 6;
  int divisions = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BD Platform - Build 0.0.1"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final points = PolygonPoints.generate(
                    sides: sides,
                    radius: BDConfig.defaultRadius,
                    center: Offset(
                      constraints.maxWidth / 2,
                      constraints.maxHeight / 2,
                    ),
                  );
                  return CustomPaint(
                    painter: PolygonPainter(points, divisions),
                    child: Container(),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text('اضلاع: '),
                      Expanded(
                        child: Slider(
                          min: BDConfig.minSides.toDouble(),
                          max: BDConfig.maxSides.toDouble(),
                          divisions: BDConfig.maxSides - BDConfig.minSides,
                          value: sides.toDouble(),
                          onChanged: (val) {
                            setState(() {
                              sides = val.round();
                            });
                          },
                        ),
                      ),
                      Text(' $sides'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('تقسیمات: '),
                      Expanded(
                        child: Slider(
                          min: BDConfig.minDivisions.toDouble(),
                          max: BDConfig.maxDivisions.toDouble(),
                          divisions: BDConfig.maxDivisions - BDConfig.minDivisions,
                          value: divisions.toDouble(),
                          onChanged: (val) {
                            setState(() {
                              divisions = val.round();
                            });
                          },
                        ),
                      ),
                      Text(' $divisions'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'نسخه ۰.۰.۱ - فقط نمایش هندسه (بدون صدا)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
