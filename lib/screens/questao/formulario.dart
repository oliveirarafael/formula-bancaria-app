import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/resposta.dart';

class FormularioQuestao extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestaoState();
  }
}

class QuestaoState extends State<FormularioQuestao> {
  String _descricao, _comentario;
  Modulo _modulo;

  int _quantidadeResposta = 0;
  final int _limiteResposta = 4;
  List<Resposta> _respostas = [];
  var _respostaSelecionada = [false, false, false, false];
  var _iconeRespostaSelecionada = [
    Icons.check_box_outline_blank,
    Icons.check_box_outline_blank,
    Icons.check_box_outline_blank,
    Icons.check_box_outline_blank
  ];

  final _questaoKey = GlobalKey<FormState>();
  TextEditingController _resposta;

  BuildContext _context;
  bool _campoRespostaHabilidatado = true;

  @override
  void initState() {
    super.initState();
    this._resposta = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Questão'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 40,
        ),
        child: Form(
          key: this._questaoKey,
          child: Column(
            children: <Widget>[
              this._descricaoFormField(),
              this._espacamento(20),
              this._comentarioFormField(),
              this._espacamento(20),
              this._respostaFormField(),
              this._espacamento(20),
              RaisedButton(
                child: Text("Adicionar resposta"),
                onPressed: this._quantidadeResposta == this._limiteResposta
                    ? null
                    : () {
                        this.setState(() {
                          if (this._resposta.text.isNotEmpty) {
                            this._respostas.add(Resposta(descricao: this._resposta.text, correta: false));
                            this._resposta.text = '';
                            this._quantidadeResposta++;

                            if (this._quantidadeResposta == this._limiteResposta) {
                              this._campoRespostaHabilidatado = false;
                            } else {
                              this._campoRespostaHabilidatado = true;
                            }
                          } else {
                            showDialog(
                              context: this._context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Resposta'),
                                  content: Text('Preencha o campo Resposta'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
              ),
              this._respostasList(),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  var currentState = this._questaoKey.currentState;
                  if (currentState.validate()) {
                    if (this._respostas.length < 2) {
                      showDialog(
                        context: this._context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Resposta'),
                            content: Text('Adicione ao menos duas resposta'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    bool teveRespostaCorretaSelecionada = this._respostas.any((resposta) => resposta.correta == true );

                    if (!teveRespostaCorretaSelecionada) {
                      showDialog(
                        context: this._context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Resposta'),
                            content: Text('Selecione pelo uma resposta correta'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );

                      return;
                    }

                    currentState.save();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _espacamento(double tamanho) {
    return SizedBox(
      height: tamanho,
    );
  }

  Widget _descricaoFormField() {
    return TextFormField(
      onSaved: (descricao) {
        this._descricao = descricao;
      },
      validator: (descricao) {
        if (descricao.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Descrição",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _comentarioFormField() {
    return TextFormField(
      onSaved: (comentario) {
        this._comentario = comentario;
      },
      validator: (comentario) {
        if (comentario.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Comentário",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _respostaFormField() {
    return TextField(
      controller: this._resposta,
      keyboardType: TextInputType.text,
      enabled: this._campoRespostaHabilidatado,
      decoration: InputDecoration(
          labelText: "Resposta",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _respostasList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: this._respostas.length,
      itemBuilder: (context, posicao) {
        return Card(
          child: ListTile(
            leading: Icon(this._iconeRespostaSelecionada[posicao]),
            selected: this._respostaSelecionada[posicao],
            title: Text(this._respostas[posicao].descricao.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print(posicao);
                this.setState(() {
                  this._respostas.removeAt(posicao);
                  this._respostaSelecionada[posicao] = false;
                  this._iconeRespostaSelecionada[posicao] =
                      Icons.check_box_outline_blank;
                  this._quantidadeResposta--;
                });
              },
            ),
            onTap: () {
              print(posicao);
              this.setState(() {
                for (int posicaoAtual = 0; posicaoAtual < this._respostaSelecionada.length; posicaoAtual++) {
                  if (posicaoAtual == posicao) {
                    this._respostaSelecionada[posicao] = true;
                    this._iconeRespostaSelecionada[posicao] = Icons.check_box;
                    this._respostas[posicao] = Resposta(
                      descricao: this._respostas[posicao].descricao,
                      correta: true,
                    );
                  } else {
                    this._respostaSelecionada[posicaoAtual] = false;
                    this._iconeRespostaSelecionada[posicaoAtual] =
                        Icons.check_box_outline_blank;
                  }
                }
              });
            },
          ),
        );
      },
    );
  }
}
