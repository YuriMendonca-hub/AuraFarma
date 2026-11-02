import 'package:flutter/material.dart';
import 'estoque.dart';
import 'scanner.dart';
import 'solicitados.dart';
import 'contagem.dart';
import 'assistente.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget{
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial>{
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    TelaEstoque(),
    TelaAssistente(),
    TelaContagem(),
    TelaSolicitados(),
    TelaScanner(),
  ];

  void MudardeTela(int index){
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _indiceAtual, children: _telas),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: MudardeTela,

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 169, 65, 25),
        unselectedItemColor: const Color.fromARGB(255, 20, 20, 20),
        selectedIconTheme: IconThemeData(size: 30),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: "Estoque"),
          BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), label: "Assistente de ia"),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "Contagem"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Solicitados",),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Scanner",),
        ]
        ),
    );
  }
}

class Medicamentos{
    final String nome;
    final String codigo;
    final String categorias;
    final int quantidade;
    final double preco;

    Medicamentos({
      required this.nome,
      required this.codigo,
      required this.categorias,
      required this.quantidade,
      required this.preco,
    });
  }