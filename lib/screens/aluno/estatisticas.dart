import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/cabecalho.dart';
import 'package:formula_bancaria_app/components/centered_circular_progress.dart';
import 'package:formula_bancaria_app/components/centered_message.dart';
import 'package:formula_bancaria_app/components/rodape.dart';
import 'package:formula_bancaria_app/controllers/estatistica.controller.dart';
import 'package:formula_bancaria_app/models/simulado_respondido_estatistica.dart';
import 'package:intl/intl.dart';

class Estatistica extends StatefulWidget {
  @override
  _EstatisticaState createState() => _EstatisticaState();
}

class _EstatisticaState extends State<Estatistica> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final _controller = EstatisticaController();
  // SimuladoRespondidoEstatistica _estatisticas = null;

  // var _simulados = ['CPA 10','CPA 20','CEA','AAI','CFP'];
  List<String> _simulados = new List<String>();
  // var _itemSelecionado = 'CPA 10';
  String _itemSelecionado = '';
  List<int> _simuladosIds = new List<int>();
  // var _idItemSelecionado = 1;
  int _idItemSelecionado = 0;
  var _listaFlSpot = new List<FlSpot>();
  var _lastModuleIndexLoaded = 0;
  SimuladoRespondidoEstatistica estatisticaFlSpot;

  bool _loading = true;

  _dropDownItemSelected(String novoItem) async {
       setState(() {
        this._itemSelecionado = novoItem;

        if(_itemSelecionado == 'CPA 10') _idItemSelecionado = 1;
        if(_itemSelecionado == 'CPA 20') _idItemSelecionado = 2;
        if(_itemSelecionado == 'CEA') _idItemSelecionado = 3;
        if(_itemSelecionado == 'AAI') _idItemSelecionado = 4;
        if(_itemSelecionado == 'CFP') _idItemSelecionado = 5;

        _itemSelecionado = _simulados[_idItemSelecionado-1];
        _buildPage();
       });
  }

  bool showAvg = false;

  Future<void> _initialize() async {
    await _controller.initialize();
    getListFlSpot();

    var simuladosDescricao = _controller.getSimulados();
    if(simuladosDescricao != null && simuladosDescricao.length > 0)
    {
      for(var simuladoDescricao in simuladosDescricao)
      {
        _simulados.add(simuladoDescricao.descricao); 
        _simuladosIds.add(simuladoDescricao.id);
      }

       _itemSelecionado = _simulados[0];
       _idItemSelecionado = _simuladosIds[0];
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: SingleChildScrollView(child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: _buildPage()
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

  _buildPage() {
    if (_loading) return CenteredCircularProgress();
    
    _controller.getEstatisticasPorSimuladoAsync(_idItemSelecionado).then((response) {});

    if (_controller.getEstatisticas() == null)
      return CenteredMessage(
        'Sem informações de estatísticas',
        icon: Icons.warning,
      );
    
    return Column(children: <Widget>[
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
                              loadData(),
                            ),
                          ),
                        ),
                      ),
                      loadPercents(),
                      loadPercents(),
                      loadPercents(),
                      // Padding(padding: EdgeInsets.all(5.0), child: 
                      //   Container(
                      //     decoration: const BoxDecoration(
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(18),
                      //         ),
                      //         color: Color(0xff232d37)),
                      //     child: 
                      //       Row(children: <Widget>[
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                      //           child: 
                      //             Column(children: <Widget>[
                      //               Column(children: <Widget>[
                      //                 Text("Módulo 5", style: TextStyle(color: Colors.blue, fontSize: 14)),
                      //                 Text("33%", style: TextStyle(color: Colors.white, fontSize: 12)),
                      //               ]),
                      //             ],)
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(10.0),
                      //           child: 
                      //             Column(children: <Widget>[
                      //               Column(children: <Widget>[
                      //                 Text("Módulo 6", style: TextStyle(color: Colors.blue, fontSize: 14)),
                      //                 Text("41%", style: TextStyle(color: Colors.white, fontSize: 12)),
                      //               ]),
                      //             ],)
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(10.0),
                      //           child: 
                      //             Column(children: <Widget>[
                      //               Column(children: <Widget>[
                      //                 Text("Módulo 7", style: TextStyle(color: Colors.blue, fontSize: 14)),
                      //                 Text("45%", style: TextStyle(color: Colors.white, fontSize: 12)),
                      //               ]),
                      //             ],)
                      //         ),
                      //       ]),
                      //   ),
                      // ),
                    ]),
                  ),
                ),
                Rodape()
              ]);
  }

  getListFlSpot()
  {
    estatisticaFlSpot = _controller.getEstatisticas();

    _listaFlSpot.clear();

    for(var i = 0; i < estatisticaFlSpot.estatisticasPorSimulados.length; i++)
    {
      _listaFlSpot.add(FlSpot(i.toDouble(), estatisticaFlSpot.estatisticasPorSimulados[i].percentualAcertos));
    }
  }

  LineChartData loadData() {
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
          reservedSize: 40,
          textStyle: const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 10),
          rotateAngle: 295.0,
          getTitles: (value) {
            // return value.toString();
            //return '12/02';
            // SimuladoRespondidoEstatistica estatistica = _controller.getEstatisticas();
            int i = value.toInt();
            return DateFormat('dd/MM/yyyy').format(estatisticaFlSpot.estatisticasPorSimulados[i].data);
            // return estatisticaFlSpot.estatisticasPorSimulados.data.toString();
            // return 'Data';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
              case 60:
                return '60';
              case 70:
                return '70';
              case 80:
                return '80';
              case 90:
                return '90';
              case 100:
                return '100';
            }
            return '';
          },
          reservedSize: 25,
          margin: 5,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 0)),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 110,
      lineBarsData: [
        LineChartBarData(
          spots: _listaFlSpot,
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
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

  List<Widget> loadModulePercent()
  {
    SimuladoRespondidoEstatistica estatistica = _controller.getEstatisticas();
    if(estatistica == null || estatistica.estatisticasPorModulos == null)
      // return <Widget>[Padding(
      //   padding: const EdgeInsets.only(left: 15.0, right: 5.0),
      //   child: Text("Nenhum dado encontrado")
      // )];
      return <Widget>[];

    if(_lastModuleIndexLoaded >=  estatistica.estatisticasPorModulos.length) 
      // return <Widget>[Padding(
      //   padding: const EdgeInsets.only(left: 15.0, right: 5.0),
      //   child: Text("Nenhum dado encontrado")
      // )];
      return <Widget>[];

    var quantidadeModulosExibidos = 4;
    
    var primeiroItemInterno = _lastModuleIndexLoaded;
    var ultimoIndiceExibido = 0;
    
    if((primeiroItemInterno + quantidadeModulosExibidos) > estatistica.estatisticasPorModulos.length)
    {
      ultimoIndiceExibido = estatistica.estatisticasPorModulos.length;
    }
    else
    {
      ultimoIndiceExibido = primeiroItemInterno + quantidadeModulosExibidos;
    }

    var novaListaPercentuais = new List<SimuladoRespondidoEstatisticaModuloItem>();
    for (var modulo in estatistica.estatisticasPorModulos.getRange(primeiroItemInterno, ultimoIndiceExibido)){
        novaListaPercentuais.add(modulo);
    }

    if(novaListaPercentuais == null || novaListaPercentuais.length <= 0)
      // return <Widget>[Padding(
      //   padding: const EdgeInsets.only(left: 15.0, right: 5.0),
      //   child: Text("Nenhum dado encontrado")
      // )];
      return <Widget>[];

    var listaWidgets = new List<Widget>();
    for (var modulo in novaListaPercentuais){
      // if(_lastModuleIndexLoaded < ultimoIndiceExibido && _lastModuleIndexLoaded < estatistica.estatisticasPorModulos.length)
      // {
        listaWidgets.add(Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 5.0, top: 5.0, bottom: 5.0),
          child: 
            Column(children: <Widget>[
              Column(children: <Widget>[
                Text("Módulo " + (_lastModuleIndexLoaded + 1).toString(), style: TextStyle(color: Colors.blue, fontSize: 14)),
                Text(modulo.percentualAcertos.toString() + "%", style: TextStyle(color: Colors.white, fontSize: 12)),
              ]),
            ],)
        ));

        _lastModuleIndexLoaded = _lastModuleIndexLoaded + 1;
      // }
    }

    return listaWidgets;
  }

  Padding loadPercents()
  {
    return Padding(padding: EdgeInsets.all(10.0), child: 
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Color(0xff232d37)),
        child: 
          Row(children: 
            loadModulePercent()),
      ),
    );
  }
}