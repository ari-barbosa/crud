import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/game_tile.dart';
import '../provider/games.dart';
import '../routs/app_routes.dart';

// ignore: use_key_in_widget_constructors
class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Games games = Provider.of(context);

    return Scaffold(
        drawer: Drawer(
          // inserindo componentes gráficos
          // colocando about no menu lateral
          child: ListView(
            children: [
              ListTile(
                title: Text('About'),
                // abrindo a tela about ao clicar no link
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.ABOUT),
              ),
              ListTile(
                title: Text('Novo Cadastro'),
                // abrindo a tela about ao clicar no link
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.GAME_FORM),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Lista de Jogos'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.GAME_FORM);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: ListView.builder(
          itemCount: games.count,
          itemBuilder: (ctx, i) => GameTile(games.byIndex(i)),
        ));
  }
}
