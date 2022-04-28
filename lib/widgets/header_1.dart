import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget leftIcon, rightIcon;
  final String titulo;
  const Header(
      {Key? key,
      required this.leftIcon,
      required this.titulo,
      required this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ])),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: InkWell(
                  //onTap: () => Navigator.pop(context),
                  child: Container(
                child: leftIcon,
              ))),
          Expanded(
              flex: 6,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white)))),
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () => SystemNavigator.pop(),
                child: Container(
                  child: rightIcon,
                ),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
