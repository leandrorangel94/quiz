import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(texto),
          onPressed: quandoSelecionado,
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent,
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ));
  }
}
