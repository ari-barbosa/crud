import 'package:flutter/material.dart';
import '../routs/app_routes.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';
import '../provider/games.dart';

class GameTile extends StatelessWidget {
  final Game game;

  // ignore: use_key_in_widget_constructors
  const GameTile(this.game);

  @override
  Widget build(BuildContext context) {
    final avatar = game.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(game.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(game.jogo),
      subtitle: Text(game.categoria),
      // Teste
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.GAME_FORM,
                  arguments: game,
                );
              },
              icon: Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Games>(context, listen: false).remove(game);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
