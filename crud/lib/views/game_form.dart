// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';
import '../provider/games.dart';

class GameForm extends StatefulWidget {
  @override
  State<GameForm> createState() => _GameFormState();
}

class _GameFormState extends State<GameForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Game game) {
    _formData['id'] = game.id;
    _formData['jogo'] = game.jogo;
    _formData['data'] = game.data;
    _formData['categoria'] = game.categoria;
    _formData['plataforma'] = game.plataforma;
    _formData['avatarUrl'] = game.avatarUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final game = ModalRoute.of(context)!.settings.arguments as Game;
    _loadFormData(game);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Jogos'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Games>(context).put(
                    Game(
                      id: _formData['id'].toString(),
                      jogo: _formData['jogo'].toString(),
                      data: _formData['data'].toString(),
                      categoria: _formData['categoria'].toString(),
                      plataforma: _formData['plataforma'].toString(),
                      avatarUrl: _formData['avatarUrl'].toString(),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['jogo'],
                decoration: const InputDecoration(labelText: 'Nome do jogo'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido';
                  }

                  if (value.trim().length <= 3) {
                    return 'Minimo de 3 caracteres';
                  }

                  return null;
                },
                onSaved: (value) => _formData['jogo'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['data'],
                decoration: const InputDecoration(labelText: 'DD/MM/AAAA'),
                onSaved: (value) => _formData['data'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['categoria'],
                decoration: const InputDecoration(labelText: 'Categoria'),
                onSaved: (value) => _formData['categoria'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['plataforma'],
                decoration: const InputDecoration(labelText: 'Plataforma'),
                onSaved: (value) => _formData['plataforma'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['AvatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
