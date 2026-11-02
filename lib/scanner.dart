import 'package:flutter/material.dart';

class TelaScanner extends StatefulWidget{
  const TelaScanner({super.key});

  @override
  State<TelaScanner> createState() => _TelaScanner();
}

class _TelaScanner extends State<TelaScanner>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        
      ),
      appBar: AppBar(
        title: const Text("Scanner"),
      ),
    );
  }
}