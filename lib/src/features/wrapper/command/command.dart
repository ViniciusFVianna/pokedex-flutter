// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../home/domain/usecase/get_pokemons/get_pokemons.dart';
import '../result/result.dart';

typedef CommandActionPokemons<T> = Future<GetPokemonResult> Function();


abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

Result? _result;

  bool get error => _result is Error;

  bool get completed => _result is Success;

  Result? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }

}

class HomeCommand<T> extends Command<T> {
  HomeCommand(this._action);

  final CommandActionPokemons<T> _action;

  /// Executes the action.
  Future<void> execute() async {
    await _execute(_action);
  }
}
