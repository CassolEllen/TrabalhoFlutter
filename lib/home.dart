import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aqui ó")),
      drawer: const CustomDrawer(),
      body: Center(
        child: Image.asset(
          "assets/images/image2.jpg",
          width: 900,
          height: 900,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
