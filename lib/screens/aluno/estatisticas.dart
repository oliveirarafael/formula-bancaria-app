import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/cabecalho.dart';
import 'package:formula_bancaria_app/components/rodape.dart';

class Estatistica extends StatefulWidget {
  @override
  _EstatisticaState createState() => _EstatisticaState();
}

class _EstatisticaState extends State<Estatistica> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  var _simulados = ['Selecione','CPA 10','CPA 20','CEA','AAI','CFP'];
  var _itemSelecionado = 'Selecione';

  void _dropDownItemSelected(String novoItem){
       setState(() {
        this._itemSelecionado = novoItem;
       });
  }

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: SingleChildScrollView(child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(children: <Widget>[
                Cabecalho(),
                Center(child: 
                  Container(
                     color: Colors.white,
                     height: 500,
                    alignment: Alignment.center,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 12.0, bottom: 5.0), child: 
                        Center(child: 
                          Text("Estatísticas", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor, fontWeight: FontWeight.bold, decoration: null, fontSize: 22.0)),
                        ),
                      ),
                      DropdownButton<String>(
                            items : _simulados.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                                );
                            }).toList(),
                            onChanged: ( String novoItemSelecionado) {
                              _dropDownItemSelected(novoItemSelecionado);
                              setState(() {
                                this._itemSelecionado =  novoItemSelecionado;
                              });
                            },
                            value: _itemSelecionado
                          ),
                      Padding(padding: EdgeInsets.all(5.0), child: 
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color(0xff232d37)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 0, bottom: 5),
                            child: LineChart(
                              showAvg ? avgData() : mainData(),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0), child: 
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color(0xff232d37)),
                          child: 
                            Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 1", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("33%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 2", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("41%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 3", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("45%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 4", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("45%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                            ]),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5.0), child: 
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color(0xff232d37)),
                          child: 
                            Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 5", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("33%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 6", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("41%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: 
                                  Column(children: <Widget>[
                                    Column(children: <Widget>[
                                      Text("Módulo 7", style: TextStyle(color: Colors.blue, fontSize: 14)),
                                      Text("45%", style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ]),
                                  ],)
                              ),
                            ]),
                        ),
                      ),
                    ]),
                  ),
                ),
                Rodape()
              ]),
            ),
          ),
        ),
      ),
    );
        // SizedBox(
        //   width: 60,
        //   height: 34,
        //   child: FlatButton(
        //     onPressed: () {
        //       setState(() {
        //         showAvg = !showAvg;
        //       });
        //     },
        //     child: Text(
        //       'avg',
        //       style: TextStyle(
        //           fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
        //     ),
        //   ),
        // ),
      // ],
    // );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle:
              const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle:
              const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}