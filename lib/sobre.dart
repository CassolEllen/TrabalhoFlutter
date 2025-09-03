import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("Sobre o App 🐾"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "🐱",
                  style: TextStyle(fontSize: 60),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Avaliação Prática Flutter – Mini App com Calculadora, matéria Desenvolvimento de Sistemas Móveis e Distribuídos. Este aplicativo foi desenvolvido como parte de uma avaliação da disciplina de Flutter. O objetivo é criar uma calculadora funcional e estilosa, com um layout intuitivo e divertido, que permita realizar as quatro operações básicas de forma simples. Além disso, o projeto foi pensado para exercitar o uso de widgets, gerenciamento de estado e navegação entre telas no Flutter. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Desenvolvido por: Ellen Cristina Cassol",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Voltar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
