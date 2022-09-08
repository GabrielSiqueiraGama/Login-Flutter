import 'package:flutter/material.dart';

class PaginaPerfil extends StatefulWidget {
  const PaginaPerfil({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaginaPerfil();
  }
}

class _PaginaPerfil extends State<PaginaPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagina de perfil.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.4)
              ])),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: <Widget>[
                const Icon(Icons.notifications),
                Positioned(
                    child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(),
      ),
    );
  }
}
