import 'package:flutter/material.dart';

class TelaSolicitados extends StatefulWidget{
  const TelaSolicitados({super.key});

  @override
  State<TelaSolicitados> createState() => _TelaSolicitados();
}

class _TelaSolicitados extends State<TelaSolicitados>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        
      ),
      appBar: AppBar(
        title: const Text("Solicitados"),
      ),
    );
  }
}