import 'dart:async';

import 'package:angular2/core.dart';

import '../models/language.dart';

@Injectable()
class LanguageService {
  final List<Language> allLanguages = [
    new Language('pt', 'Português'),
    new Language('br', 'English')
  ];

  LanguageService();

  Future<List<Language>> findAll() async {
    try {
      return allLanguages;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }
}
