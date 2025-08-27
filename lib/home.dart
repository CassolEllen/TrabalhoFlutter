import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Boas-vindas")),
      body: const Center(
        child: Text(
          " Bem-vindo veir juro!",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
