import 'package:flutter/material.dart';
import 'package:perfil_user/common/theme_helper.dart';
import 'package:perfil_user/pages/Codigo_esqueci_senha.dart';
import 'package:perfil_user/pages/widgets/header_widget.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({super.key});

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            child: const HeaderWidget(300, true, Icons.password_rounded),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Esqueceu a senha',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Digite o e-mail que você utiliza na sua conta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Enviaremos um email com um codigo para verificar a autenticidade",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration(
                                    "Email", "Digite seu email"),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Email não pode estar vazio";
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                    return "Coloque um email valido";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          Container(
                            decoration:
                                ThemeHelper().botaoBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Send".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CodigoEsqueciSenha()),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
