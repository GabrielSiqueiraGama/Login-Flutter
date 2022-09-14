import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:perfil_user/pages/tela_abertura.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final Color _primaryColor = HexColor('#00FA9A');

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil do usuario',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: const TelaAbertura(title: 'Login'),
    );
  }
}
