import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula_bancaria_app/components/alerts_fb.dart';
import 'package:formula_bancaria_app/components/button_fb.dart';
import 'package:formula_bancaria_app/components/spacing_fb.dart';
import 'package:formula_bancaria_app/components/text_field_fb.dart';
import 'package:formula_bancaria_app/components/text_form_field_fb.dart';
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
              TextFormFieldFB(
                value: this._descricao,
                label: "Descrição",
              ),
              SpacingFB(
                height: 20,
              ),
              TextFormFieldFB(
                value: this._descricao,
                label: "Comentário",
              ),
              Spacer(
                flex: 2,
              ),
              TextFieldFB(
                controller: this._resposta,
                enabled: this._campoRespostaHabilidatado,
                label: "Resposta",
              ),
              SpacingFB(
                height: 20,
              ),
              RaisedButton(
                child: Text("Adicionar resposta"),
                onPressed: this._quantidadeResposta == this._limiteResposta
                    ? null
                    : () {
                        this.setState(() {
                          if (this._resposta.text.isNotEmpty) {
                            this._respostas.add(Resposta(
                                descricao: this._resposta.text,
                                correta: false));
                            this._resposta.text = '';
                            this._quantidadeResposta++;

                            if (this._quantidadeResposta ==
                                this._limiteResposta) {
                              this._campoRespostaHabilidatado = false;
                            } else {
                              this._campoRespostaHabilidatado = true;
                            }
                          } else {
                            Alerts.information(
                              title: "Resposta",
                              content: "Preencha o campo Resposta",
                              context: context,
                            );
                          }
                        });
                      },
              ),
              this._respostasList(),
              ButtonFB(
                  text: "Salvar",
                  onPressed: () {
                    var currentState = this._questaoKey.currentState;

                    if (currentState.validate()) {
                      if (this._respostas.length < 2) {
                        Alerts.information(
                          title: "Resposta",
                          content: "Adicionane ao menos duas resposta",
                          context: context,
                        );
                        return;
                      }

                      bool teveRespostaCorretaSelecionada = this._respostas.any((resposta) => resposta.correta == true);

                      if (!teveRespostaCorretaSelecionada) {
                        Alerts.information(
                          title: 'Resposta',
                          content: 'Selecione pelo uma resposta correta',
                          context: context,
                        );
                        return;
                      }

                      currentState.save();
                    }
                  }),
            ],
          ),
        ),
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
                for (int posicaoAtual = 0;
                    posicaoAtual < this._respostaSelecionada.length;
                    posicaoAtual++) {
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
