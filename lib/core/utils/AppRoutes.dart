import 'package:flutter/material.dart';

import '../../features/list/presentation/pages/CharactersListScreen.dart';
import '../../features/list/presentation/pages/DetailCharacterScreen.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
}

class AppRoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CharactersListPage(),
        );
      case AppRoutes.detail:
        var args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => DetailCharacterScreen(idCharacter: args,),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const CharactersListPage(),
        );
    }
  }
}