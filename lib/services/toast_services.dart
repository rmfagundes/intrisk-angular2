import 'dart:async';

import 'package:angular2/core.dart';

import '../models/toast.dart';

@Injectable()
class ToastService {
  final List<Toast> toasts = [];

  ToastService();

  Future<List<Toast>> findAll() async {
    try {
      return toasts;
    } catch (e) {
      throw _handleError(e);
    }
  }

  void add(nuToast) {
    var rnd = new Random();

    var found = false;
    do {
      nuToast.id = rnd.nextInt();
      found = false;
      for (var toast in toasts) {
        if (toast.id == nuToast.id) {
          found = true;
          break;
        }
      }
    } while (!found);

    toasts.push(nuToast);
    return toasts;
  }

  void remove(remToast) {
    toasts.remove(remToast);
    return toasts;
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }
}
