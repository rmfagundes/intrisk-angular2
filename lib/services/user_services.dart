import 'dart:async';

import 'package:angular2/core.dart';

import '../models/user.dart';

@Injectable()
class UserService {
  User user;

  UserService();

  Future<User> find() async {
    try {
      return user;
    } catch (e) {
      throw _handleError(e);
    }
  }

  void login() {
    // Call to API
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }
}
