import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:perfil_user/pages/tela_abertura.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#DC54FE');

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil do usuario',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: const TelaAbertura(title: 'Login'),
    );
  }
}
