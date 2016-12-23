import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../models/risktype.dart';

@Injectable()
class RiskTypeService {
  static const _riskAPIBaseUrl = 'http://192.168.99.100:3002/';
  static const _riskTypesUrl = 'risktypes';
  static const _riskTypeUrl = 'risktypes';
  final Client _http;

  RiskTypeService(this._http);

  Future<List<RiskType>> findAll() async {
    try {
      final response = await _http.get(_riskAPIBaseUrl + _riskTypesUrl);
      final risktypes = _extractData(response)
          .map((value) => new RiskType.fromJson(value))
          .toList();
      return risktypes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<RiskType> findById(id) async {
    try {
      final response = await _http.get(_riskAPIBaseUrl + _riskTypeUrl + "/" + id);
      final jsonResponse = JSON.decode(response.body);
      return new RiskType(jsonResponse['id'], jsonResponse['name'], jsonResponse['language']);
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }
}
