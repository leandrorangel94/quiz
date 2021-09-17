import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Seu nível: Younglin!";
    } else if (pontuacao < 12) {
      return "Seu nível: Padawan!";
    } else if (pontuacao < 18) {
      return "Seu nível: Cavaleiro Jedi!";
    } else {
      return 'Seu nível: Mestre Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Reiniciar?'),
          onPressed: quandoReiniciarQuestionario,
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
