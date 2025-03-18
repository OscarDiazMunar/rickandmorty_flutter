import 'package:get_it/get_it.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/DioNetwork.dart';
import 'package:rickandmorty_app/features/list/presentation/di/CharactersInjections.dart';

final serviceLocator = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initCharactersInjections();
}

Future<void> initDioInjections() async {
  DioNetwork.initDio();
}