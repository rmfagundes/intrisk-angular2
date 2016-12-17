import 'dart:async';
import 'package:angular2/core.dart';

import 'models/risktype.dart';

import 'services/risktype_services.dart';

@Component(
  selector: 'risktypes',
  templateUrl: './templates/risktypes.html',
  providers: const[RiskTypeService]
)
class RiskTypesComponent implements OnInit {
  List<RiskType> risktypes;

  final RiskTypeService _rtypeService;

  RiskTypesComponent(this._rtypeService);

  Future<Null> findAll() async {
    risktypes = await _rtypeService.findAll();
  }

  void ngOnInit() {
    findAll();
  }
}
