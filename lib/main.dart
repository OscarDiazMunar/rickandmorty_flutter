import 'package:flutter/material.dart';

import 'core/utils/injections.dart';
import 'features/list/presentation/pages/CharactersListScreen.dart';

void main() async {

  await initInjections();
  runApp(CharactersListScreen());
}