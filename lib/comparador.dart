import 'package:flutter/material.dart';

class comparadorPreco extends StatefulWidget {
  const comparadorPreco({super.key});

  @override
  State<comparadorPreco> createState() => _comparadorPrecoState();
}

class _comparadorPrecoState extends State<comparadorPreco> {
  TextEditingController precoOpcaoA = TextEditingController();
  TextEditingController qtdOpcaoA = TextEditingController();
  TextEditingController precoOpcaob = TextEditingController();
  TextEditingController qtdOpcaob = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparador de Preço por Unidade"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              // TextField(
              //   controller: precoOpcaoA,
              //   keyboardType: TextInputType.number,
              // ),
            ),
            Container(child: TextField(keyboardType: TextInputType.number)),
          ],
        ),
      ),
    );
  }
}
