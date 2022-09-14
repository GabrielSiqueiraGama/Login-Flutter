import 'package:flutter/material.dart';
import 'package:perfil_user/common/theme_helper.dart';
import 'package:perfil_user/pages/pagina_perfil.dart';
import 'package:perfil_user/pages/widgets/header_widget.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({super.key});

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final Key _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        offset: Offset(5, 5),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade100,
                                  size: 80,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60),
                        TextFormField(
                          decoration: ThemeHelper()
                              .textInputDecoration("Digite seu nome"),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "Nick pelo qual vai ser chamado"),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: ThemeHelper()
                              .textInputDecoration("Digite e-mail para uso"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if ((val!.isNotEmpty) &&
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(val)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: ThemeHelper()
                              .textInputDecoration("Digite sua senha"),
                          obscureText: true,
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: ThemeHelper()
                              .textInputDecoration("Confirme sua senha"),
                          obscureText: true,
                        ),
                        const SizedBox(height: 15),
                        FormField<bool>(builder: (state) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: checkboxValue,
                                    onChanged: (value) {
                                      setState(() {
                                        checkboxValue = value!;
                                        state.didChange(value);
                                      });
                                    },
                                  ),
                                  const Text(
                                      "Eu aceito todos os termos e condições.")
                                ],
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().botaoBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaginaPerfil()),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
