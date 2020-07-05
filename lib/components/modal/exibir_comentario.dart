import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/simulado-gerado.dart';

class ExibirComentarioDialog {
  static Future show(
    BuildContext context, {
    @required QuestaoSimuladoGerado question,
    // @required bool correct,
    // @required int indexRespostaCorreta,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Icon(Icons.comment, color: Colors.grey.shade900),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Comentário",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                question.comentario,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
          actions: [
            // FlatButton(
            //   child: const Text('PRÓXIMO'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //     onNext();
            //   },
            // )
          ],
        );
      },
    );
  }
}