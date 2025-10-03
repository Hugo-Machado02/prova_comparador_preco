import 'package:flutter/material.dart';

class comparadorPreco extends StatefulWidget {
  const comparadorPreco({super.key});

  @override
  State<comparadorPreco> createState() => _comparadorPrecoState();
}

class _comparadorPrecoState extends State<comparadorPreco> {
  // TextEditingController precoOpcaoA = TextEditingController();
  // TextEditingController qtdOpcaoA = TextEditingController();
  // TextEditingController precoOpcaob = TextEditingController();
  // TextEditingController qtdOpcaob = TextEditingController();
  // String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparador de Preço por Unidade"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        padding: EdgeInsets.all(10),
        child: Container(child: TextField(keyboardType: TextInputType.number)),
      ),
    );
  }
}
