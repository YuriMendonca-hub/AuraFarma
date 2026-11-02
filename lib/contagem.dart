import 'package:flutter/material.dart';

class TelaContagem extends StatefulWidget{
  const TelaContagem({super.key});

  @override
  State<TelaContagem> createState() => _TelaContagem();
}

class _TelaContagem extends State<TelaContagem>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        
      ),
      appBar: AppBar(
        title: const Text("Contagem"),
      ),
    );
  }
}