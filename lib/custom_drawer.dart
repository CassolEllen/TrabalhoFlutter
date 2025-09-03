import 'package:flutter/material.dart';
import 'package:trabalho/calculadora.dart';
import 'package:trabalho/sobre.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_list_bulleted),
            title: const Text('Sobre esse projetinho rsrs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SobrePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Calculadora"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalculadoraPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
