import 'dart:math';

import 'package:flutter/material.dart';
import '../data/dummy_games.dart';
import '../models/game.dart';

class Games with ChangeNotifier {
  final Map<String, Game> _items = {...DUMMY_GAMES};

  List<Game> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Game byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Game game) {
    if (game == null) {
      return;
    }

    // Alterar
    if (game.id != null &&
        game.id.trim().isNotEmpty &&
        _items.containsKey(game.id)) {
      _items.update(
        game.id,
        (_) => Game(
          id: game.id,
          jogo: game.jogo,
          data: game.data,
          categoria: game.categoria,
          plataforma: game.plataforma,
          avatarUrl: game.avatarUrl,
        ),
      );
    } else {
      // Adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Game(
          id: game.id,
          jogo: game.jogo,
          data: game.data,
          categoria: game.categoria,
          plataforma: game.plataforma,
          avatarUrl: game.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  // remove
  void remove(Game game) {
    if (game != null && game.id != null) {
      _items.remove(game.id);
      notifyListeners();
    }
  }
}
