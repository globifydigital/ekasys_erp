import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartContent extends StatelessWidget {
  final List<double> values;

  LineChartContent({required this.values});

  final titles = ['Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
          gridData: FlGridData(
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 10,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white.withOpacity(0.2),
              strokeWidth: 0.5,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.white.withOpacity(0.2),
              strokeWidth: 0.5,
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 25, // Adjust reserved size
                getTitlesWidget: (value, meta) {
                  final intValue = value.toInt();
                  if (intValue < 0 || intValue > 6) {
                    return SizedBox.shrink();
                  }

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      titles[intValue],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // Adjust reserved size
                interval: 10,
                getTitlesWidget: (value, meta) {
                  if (value.isNaN || value.isInfinite) {
                    return SizedBox.shrink();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      value.toInt() == 0 ? '' : value.toInt().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          minX: 0,
          minY: 0,
          maxX: values.length.toDouble() - 1,
          maxY: (values.reduce((a, b) => a > b ? a : b) * 1.2).toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: values.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
              isCurved: true,
              color: Colors.blueAccent,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blueAccent.withOpacity(0.3),
              ),
              aboveBarData: BarAreaData(show: false),
              gradient: LinearGradient(
                colors: [Colors.blueAccent.withOpacity(0.3), Colors.lightBlueAccent.withOpacity(0.1)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              curveSmoothness: 0.2,
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(),
            touchSpotThreshold: 8,
          ),
        ),
      ),
    );
  }
}
