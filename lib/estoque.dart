import 'package:aurafarma_app/main.dart';
import 'package:flutter/material.dart';

class TelaEstoque extends StatefulWidget{
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoque();
}

class _TelaEstoque extends State<TelaEstoque>{
  final List<Medicamentos> listaMed = [
    Medicamentos(nome: "Paracetamol", codigo: "676767", categorias: "Analgésico", quantidade: 67, preco: 67),
    Medicamentos(nome: "Dorflex", codigo: "424242", categorias: "Analgésico", quantidade: 42, preco: 42),
    Medicamentos(nome: "Dipirona", codigo: "767676", categorias: "Analgésico", quantidade: 76, preco: 76)
  ];

  List<Medicamentos> ListaFiltrada = [];

  @override
  void initState(){
    super.initState();
    ListaFiltrada = listaMed;
  }
  void filtrarEstoque(String textoDigitado){
    final resultado = listaMed.where((med){
      final nomeBusca = med.nome.toLowerCase();
      final codigoBusca = med.codigo.toLowerCase();
      final query = textoDigitado.toLowerCase();

      return nomeBusca.contains(query) ||  codigoBusca.contains(query);
    }).toList();
    setState(() {
      ListaFiltrada = resultado;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0), 
            child: SizedBox(
              width: 1200,
              child: TextField(
                onChanged: filtrarEstoque,
                decoration: InputDecoration(
                  hintText: "Buscar",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
              )
            ),
          )
          )
          ),
          Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical, // Permite rolar para baixo e para cima
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Permite rolar para os lados se a tela for pequena
      child: DataTable(
        // 1. As Colunas da Tabela
        columns: const [
          DataColumn(label: Text('Produto')),
          DataColumn(label: Text('Categoria')),
          DataColumn(label: Text('Estoque')),
          DataColumn(label: Text('Preço')),
        ],
        
        // 2. As Linhas da Tabela (Aqui é onde a lista entra!)
        rows: ListaFiltrada.map((med) {
          return DataRow(cells: [
            // Coluna 1: Nome e Código empilhados
            DataCell(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(med.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(med.codigo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            // Coluna 2: Categoria
            DataCell(Text(med.categorias)),
            // Coluna 3: Estoque
            DataCell(Text(med.quantidade.toString())),
            // Coluna 4: Preço
            DataCell(Text('RS${med.preco.toStringAsFixed(2)}')),
          ]);
        }).toList(),
      ),
    ),
  ),
),
        ],
      ),
      appBar: AppBar(
        title: const Text("Estoque"),
      ),
    );
  }
}