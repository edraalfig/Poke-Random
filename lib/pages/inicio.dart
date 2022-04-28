import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:poke_random/models/pokemon.dart';
import 'package:poke_random/widgets/header_1.dart';
import 'package:poke_random/widgets/titulo_1.dart';
import 'dart:math';
import 'dart:async';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int poke = 0;
  String nombre = '';

  Future<Pokemon> _getPokemon() async {
    setState(() {
      Random r = Random();
      poke = r.nextInt(898);
    });
    final res =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$poke"));
    if (res.statusCode == 200) {
      String body = utf8.decode(res.bodyBytes);
      final jsonData = jsonDecode(body);
      setState(() {
        nombre = jsonData["name"];
      });
      return Pokemon(jsonData["id"], jsonData["name"],
          jsonData["sprites"]["front_default"]);
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(
            leftIcon:
                Icon(Icons.arrow_back, color: Colors.transparent, size: 42),
            titulo: 'Random',
            rightIcon: Icon(Icons.close, color: Colors.white, size: 40)),
        body: ListView(children: [
          const Titulo(titulo: 'PokeRandom'),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(7, 8))
                ],
                gradient: const LinearGradient(colors: [
                  Color(0xff334DD2),
                  Color(0xff334588),
                  Color(0xff334AFF)
                ]),
                borderRadius: BorderRadius.circular(50)),
            child: TextButton(
                onPressed: () => _getPokemon(),
                child: const Text(
                  'Pruebame',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Text(
            '#$poke',
            style: const TextStyle(fontSize: 30),
          ),
          _crearCard1(
              context,
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$poke.png',
              nombre.toUpperCase()),
          const SizedBox(height: 40),
        ]));
  }

  Widget _crearCard1(BuildContext context, String url, String name) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(url)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
