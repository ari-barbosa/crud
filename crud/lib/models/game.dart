import 'package:flutter/material.dart';

class Game {
  final String id;
  final String jogo;
  final String data;
  final String categoria;
  final String plataforma;
  final String avatarUrl;

  const Game({
    required this.id,
    required this.jogo,
    required this.data,
    required this.categoria,
    required this.plataforma,
    required this.avatarUrl,
  });
}
