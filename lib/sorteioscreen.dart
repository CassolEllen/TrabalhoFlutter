import 'dart:math';
import 'package:flutter/material.dart';

class SorteioPage extends StatefulWidget {
  const SorteioPage({super.key});

  @override
  State<SorteioPage> createState() => _SorteioPageState();
}

class _SorteioPageState extends State<SorteioPage> {
  int? numeroSorteado;

  void sortearNumero() {
    final random = Random();
    int numero = random.nextInt(100) + 1; // de 1 até 100

    setState(() {
      numeroSorteado = numero;
    });

    if (numero == 50) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Você ganhou uma grande caixa de nada!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorteio"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: sortearNumero,
              child: const Text("Sortear número"),
            ),
            const SizedBox(height: 20),
            if (numeroSorteado != null)
              Text(
                "Número sorteado: $numeroSorteado",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
