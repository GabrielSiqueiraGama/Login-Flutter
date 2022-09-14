import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:perfil_user/common/theme_helper.dart';
import 'package:perfil_user/pages/esqueci_senha.dart';
import 'package:perfil_user/pages/pagina_perfil.dart';
import 'package:perfil_user/pages/pagina_registro.dart';
import 'package:perfil_user/pages/widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _alturaHeader = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: _alturaHeader,
              child: HeaderWidget(_alturaHeader, true, Icons.login_rounded),
            ),
            SafeArea(
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Nome do usuario.",
                                  "Digite seu nome de usuario."),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Senha:", "Digite sua senha:"),
                            ),
                            const SizedBox(height: 15),
                            Container(
                                decoration:
                                    ThemeHelper().botaoBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Entrar'),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaginaPerfil()));
                                  },
                                )),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(
                                TextSpan(children: [
                                  const TextSpan(text: 'Não tem conta?'),
                                  TextSpan(
                                    text: ' criar conta',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaginaRegistro()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  )
                                ]),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Esqueceu a senha.',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EsqueciSenha()));
                                        })
                                ]),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ]),
        ));
  }
}
