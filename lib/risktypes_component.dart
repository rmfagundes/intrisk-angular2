import 'dart:async';
import 'package:angular2/core.dart';
import 'package:http/browser_client.dart';

import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'models/risktype.dart';

import 'services/risktype_services.dart';

@Component(
  selector: 'risktypes',
  templateUrl: './templates/risktypes.html',
  providers: const[RiskTypeService, BrowserClient]
)
class RiskTypesComponent implements OnInit {
  List<RiskType> risktypes;
  String currLang;

  final RiskTypeService _rtypeService;

  RiskTypesComponent(this._rtypeService);

  Future<Null> findAll() async {
    risktypes = await _rtypeService.findAll();
  }

  void ngOnInit() {
    findSystemLocale().then((final String locale) {
      currLang = Intl.shortLocale(locale);
    });
    findAll();
  }
}
