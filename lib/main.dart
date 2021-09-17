import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Cavalo', 'pontuacao': 5},
        {'texto': 'Ovelha', 'pontuacao': 3},
        {'texto': 'Cachorro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu instrumento favorito?',
      'respostas': [
        {'texto': 'Violão', 'pontuacao': 10},
        {'texto': 'Baixo', 'pontuacao': 5},
        {'texto': 'Guitarra', 'pontuacao': 3},
        {'texto': 'Ukelele', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
