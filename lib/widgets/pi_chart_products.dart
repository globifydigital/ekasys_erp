import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final List<Sector> sectors;

  const PieChartWidget(this.sectors, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Stack(
        children: [
          Container(
            height: 100,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: _legendItems(sectors, context).map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  child: item,
                );
              }).toList(),
            ),
          ),
          PieChart(
            PieChartData(
              sections: _chartSections(sectors),
              centerSpaceRadius: 60.0,
              sectionsSpace: 5,
              borderData: FlBorderData(show: false),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: 40.0,
        title: '', // Remove title from the pie chart
      );
      list.add(data);
    }
    return list;
  }

  List<Widget> _legendItems(List<Sector> sectors, BuildContext context) {
    return sectors.map((sector) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              color: sector.color,
            ),
            SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.36,
              child: Text(
                sector.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

class Sector {
  final Color color;
  final double value;
  final String name;

  Sector({required this.color, required this.value, required this.name});
}
