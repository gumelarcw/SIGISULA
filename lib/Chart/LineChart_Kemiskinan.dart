import 'package:flutter/material.dart';
import 'package:sipadu8203/Data/KepulauanSula_Data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart_Kemiskinan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                    margin: EdgeInsets.only(top: 10, right: 2, left: 2),
                    child: SfCartesianChart(
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                          enablePinching: true,
                          enableDoubleTapZooming: true,
                          zoomMode: ZoomMode.x,
                        ),
                        trackballBehavior: TrackballBehavior(
                            activationMode: ActivationMode.singleTap,
                            enable: true,
                            tooltipSettings: InteractiveTooltip(
                                enable: true,
                                color: Color.fromARGB(225, 119, 119, 119)),
                            tooltipDisplayMode:
                                TrackballDisplayMode.groupAllPoints),
                        enableAxisAnimation: true,
                        legend: Legend(
                            isVisible: true,
                            isResponsive: true,
                            position: LegendPosition.top),
                        title: ChartTitle(
                            text: 'Kemiskinan (persen)',
                            borderWidth: 10,
                            alignment: ChartAlignment.center,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                        primaryXAxis: CategoryAxis(
                            labelIntersectAction:
                                AxisLabelIntersectAction.multipleRows,
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                            isVisible: true,
                            title: AxisTitle(
                                text: 'Tahun',
                                textStyle: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500))),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 11,
                          interval: 1,
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          isVisible: true,
                          title: AxisTitle(
                              text: 'Persentase',
                              textStyle: TextStyle(
                                  color: Colors.indigo,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500)),
                          majorGridLines: MajorGridLines(
                              width: 1,
                              color: Colors.orangeAccent,
                              dashArray: <double>[5, 5]),
                        ),
                        series: <ChartSeries>[
                          // Renders line chart
                          LineSeries<DataKemiskinan, String>(
                              color: Colors.blueAccent,
                              name: 'Kepulauan Sula',
                              dataSource: kemiskinan,
                              xValueMapper: (DataKemiskinan data, _) =>
                                  data.tahun,
                              yValueMapper: (DataKemiskinan data, _) =>
                                  data.sula,
                              markerSettings: MarkerSettings(
                                isVisible: true,
                              )),
                          LineSeries<DataKemiskinan, String>(
                              color: Colors.green,
                              name: 'Maluku Utara',
                              dataSource: kemiskinan,
                              xValueMapper: (DataKemiskinan data, _) =>
                                  data.tahun,
                              yValueMapper: (DataKemiskinan data, _) =>
                                  data.malut,
                              markerSettings: MarkerSettings(
                                isVisible: true,
                              )),
                          LineSeries<DataKemiskinan, String>(
                              color: Colors.red,
                              name: 'Indonesia',
                              dataSource: kemiskinan,
                              xValueMapper: (DataKemiskinan data, _) =>
                                  data.tahun,
                              yValueMapper: (DataKemiskinan data, _) =>
                                  data.indo,
                              markerSettings: MarkerSettings(
                                isVisible: true,
                              ))
                        ])))));
  }
}
