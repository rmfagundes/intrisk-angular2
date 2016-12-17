import 'dart:async';
import 'package:angular2/core.dart';

import '../models/risktype.dart';
import '../mock/risktypes_mock.dart';

@Injectable()
class RiskTypeService {
  Future<List<RiskType>> findAll() async => mock_risktypes;
}
