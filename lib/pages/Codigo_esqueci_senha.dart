import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:perfil_user/common/theme_helper.dart';
import 'package:perfil_user/pages/pagina_perfil.dart';

import 'widgets/header_widget.dart';

class CodigoEsqueciSenha extends StatefulWidget {
  const CodigoEsqueciSenha({super.key});

  @override
  State<CodigoEsqueciSenha> createState() => _CodigoEsqueciSenhaState();
}

class _CodigoEsqueciSenhaState extends State<CodigoEsqueciSenha> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              const SizedBox(
                height: 300,
                child: HeaderWidget(300, true, Icons.privacy_tip_outlined),
              ),
              SafeArea(
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
                          children: const [
                            Text(
                              "Verificação",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Digite o codigo que recebeu no seu email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    OTPTextField(
                      length: 4,
                      width: 300,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 30),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        setState(() {
                          _pinSuccess = true;
                        });
                      },
                    ),
                    const SizedBox(height: 50.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Caso não tenha recebido o codigo, ",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          TextSpan(
                            text: 'clique aqui',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alartDialog(
                                        "Codigo reenviado.",
                                        "Confira novamente.",
                                        context);
                                  },
                                );
                              },
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      decoration: _pinSuccess
                          ? ThemeHelper().botaoBoxDecoration(context)
                          : ThemeHelper().botaoBoxDecoration(
                              context, "#AAAAAA", "#757575"),
                      child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          onPressed: _pinSuccess
                              ? () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaginaPerfil()),
                                      (Route<dynamic> route) => false);
                                }
                              : null,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              "Verificar",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
