import 'package:flutter/material.dart';

class TelaAssistente extends StatefulWidget{
  const TelaAssistente({super.key});

  @override
  State<TelaAssistente> createState() => _TelaAssistente();
}

class _TelaAssistente extends State<TelaAssistente>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        
      ),
      appBar: AppBar(
        title: const Text("Assistente de ia"),
      ),
    );
  }
}