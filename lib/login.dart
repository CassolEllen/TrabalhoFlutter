import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String senha = _senhaController.text.trim();

      if (email == "admin" && senha == "123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Algo deu errado, revise se seus dados estão corretos"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Insira seu e-mail' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Insira sua senha' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
