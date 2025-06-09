import 'package:flutter/material.dart';

class DetailCharacterScreen extends StatelessWidget {
  final int idCharacter;

  const DetailCharacterScreen({super.key, required this.idCharacter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(idCharacter.toString())),
      body: Center(child: Text(idCharacter.toString())),
    );
  }
}