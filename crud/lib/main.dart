import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/games.dart';
import 'routs/app_routes.dart';
import 'views/about.dart';
import 'views/game_form.dart';
import 'views/game_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Games(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GameList(),
        routes: {
          AppRoutes.HOME: (_) => GameList(),
          AppRoutes.GAME_FORM: (_) => GameForm(),
          AppRoutes.ABOUT: (context) => const About(),
        },
      ),
    );
  }
}
