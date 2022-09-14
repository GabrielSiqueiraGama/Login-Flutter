import 'package:flutter/material.dart';
import 'package:perfil_user/pages/widgets/header_widget.dart';

class CodigoEsqueciSenha extends StatefulWidget {
  const CodigoEsqueciSenha({super.key});

  @override
  State<CodigoEsqueciSenha> createState() => _CodigoEsqueciSenhaState();
}

class _CodigoEsqueciSenhaState extends State<CodigoEsqueciSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        Column(
          children: [
            Container(
              height: 300,
              child: const HeaderWidget(300, true, Icons.privacy_tip_outlined),
            ),
            SafeArea(
                child: Container(
                    child: Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Verificação")],
                    ),
                  )
                ],
              ),
            )))
          ],
        )
      ])),
    );
  }
}
