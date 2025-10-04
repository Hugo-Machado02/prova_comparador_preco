import 'package:flutter/material.dart';

class comparadorPreco extends StatefulWidget {
  const comparadorPreco({super.key});

  @override
  State<comparadorPreco> createState() => _comparadorPrecoState();
}

class _comparadorPrecoState extends State<comparadorPreco> {
  final TextEditingController precoOpcaoA = TextEditingController();
  final TextEditingController qtdOpcaoA = TextEditingController();
  final TextEditingController precoOpcaob = TextEditingController();
  final TextEditingController qtdOpcaob = TextEditingController();
  String _textoOpcaoA = "";
  String _textoOpcaoB = "";
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparador de Preço por Unidade"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: precoOpcaoA,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Digite o Valor da Opção A"),
                        suffix: Text("R\$"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: qtdOpcaoA,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Digite a Quantidade Opção A"),
                        suffix: Text("ML"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: precoOpcaob,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Digite o Valor da Opção B"),
                        suffix: Text("R\$"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: qtdOpcaob,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text("Digite a Quantidade Opção B"),
                        suffix: Text("L"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    double valorA = double.parse(precoOpcaoA.text);
                    double qtdA = double.parse(qtdOpcaoA.text);
                    double valorB = double.parse(precoOpcaob.text);
                    double qtdB = double.parse(qtdOpcaob.text);

                    //Conversão de ML para L
                    double _qtdALitros = qtdA / 1000;

                    double calcOpcaoA = valorA / _qtdALitros;
                    double calcOpcaoB = valorB / qtdB;

                    _textoOpcaoA =
                        "Opção A: R\$ ${valorA.toStringAsFixed(2)} por ${qtdA.toStringAsFixed(2)}ML ==> ${_qtdALitros}L ==> ${calcOpcaoA}/L";

                    _textoOpcaoB =
                        "Opção A: R\$ ${valorB.toStringAsFixed(2)} por ${qtdB.toStringAsFixed(2)} ==> $calcOpcaoB/L";

                    if (calcOpcaoA == calcOpcaoB) {
                      _resultado =
                          "Ambas as Opões possuem o valor por litro iguais";
                    } else if (calcOpcaoA < calcOpcaoB) {
                      double percentual =
                          ((calcOpcaoB - calcOpcaoA) / calcOpcaoA) * 100;
                      _resultado =
                          "A opção A compensa mais (~ ${percentual.toStringAsFixed(2)}% mais barato)";
                    } else {
                      double percentual =
                          (calcOpcaoA - calcOpcaoB) / calcOpcaoB * 100;
                      _resultado =
                          "A opção B compensa mais (~ ${percentual.toStringAsFixed(2)}% mais barato)";
                    }
                  });
                },
                child: Text("Calcular", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(_textoOpcaoA),
                  Text(_textoOpcaoB),
                  Text(_resultado),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
