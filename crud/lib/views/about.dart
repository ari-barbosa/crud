import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold container pré-definido -> Já possui o app bar, div de conteudo e rodapé
      appBar: AppBar(
        title: const Text('Sobre'), // Criando o titulo
      ),
      body: const Text('Drawer'),
    );
  }
}
