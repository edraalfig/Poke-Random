import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String titulo;
  const Titulo({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(titulo,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff334DD2))),
        ],
      ),
    );
  }
}
