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
  String _descricao, _comentario, _resposta;
  List<Resposta> _respostas = [];
  Modulo _modulo;

  final _questaoKey = GlobalKey<FormState>();
  BuildContext _context;

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
    return TextFormField(
      onSaved: (resposta) {
        this._resposta = resposta;
      },
      validator: (resposta) {
        if (resposta.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.text,
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
}
