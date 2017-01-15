import 'dart:async';

import 'package:angular2/core.dart';

import '../models/snack.dart';

@Injectable()
class SnackService {
  Snack snack;

  SnackService();

  Future<Snack> find() async {
    try {
      return snack;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Snack current() {
    return snack;
  }

  void add(nuSnack) {
    if (snack != null) {
      remove();
    }

    snack = nuSnack;
  }

  void remove() {
    snack = null;
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }
}
