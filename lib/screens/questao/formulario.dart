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
  var _iconeRespostaSelecionada = [Icons.check_box_outline_blank, 
                                   Icons.check_box_outline_blank, 
                                   Icons.check_box_outline_blank, 
                                   Icons.check_box_outline_blank];

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
                onPressed: () {
                  this.setState(() {
                        this._respostas.add(Resposta(descricao: this._resposta.text));
                        this._resposta.text = '';
                        this._quantidadeResposta++;

                        if(this._quantidadeResposta == this._limiteResposta){
                          this._campoRespostaHabilidatado = false;
                        }else{
                          this._campoRespostaHabilidatado = true;
                        }

                      });
                },
              ),
              this._respostasList(),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {},
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
                },
              ),
            onTap: (){
               print(posicao);
               this.setState((){
                 for(int posicaoAtual = 0; posicaoAtual < this._respostaSelecionada.length; posicaoAtual++){
                   if(posicaoAtual == posicao){
                    this._respostaSelecionada[posicao] = true;
                    this._iconeRespostaSelecionada[posicao] = Icons.check_box;
                   }else{
                    this._respostaSelecionada[posicaoAtual] = false;
                    this._iconeRespostaSelecionada[posicaoAtual] = Icons.check_box_outline_blank;
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
