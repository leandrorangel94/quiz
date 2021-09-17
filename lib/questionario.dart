import './questao.dart';
import './resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada].cast()['texto'].toString()),
        ...respostas.map((res) {
          return Resposta(res['texto'].toString(),
              () => quandoResponder(int.parse(res['pontuacao'].toString())));
        }).toList(),
      ],
    );
  }
}
