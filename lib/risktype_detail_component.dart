import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:http/browser_client.dart';

import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'models/risktype.dart';
import 'models/toast.dart';

import 'services/risktype_services.dart';
import 'services/language_services.dart';

@Component(
  selector: 'risktype-view',
  templateUrl: './templates/risktype.html',
  providers: const[RiskTypeService, LanguageService, BrowserClient]
)
class RiskTypeDetailComponent implements OnInit {
  RiskType risktype;
  Language languages;
  String currLang;

  String _id;

  final RouteParams _routeParams;
  final RiskTypeService _rtypeService;
  final LanguageService _langService;
  final ToastService _toastService;

  @Output() EventEmitter addToastEvent = new EventEmitter<Toast>();

  final Boolean editable = true;

  RiskTypeDetailComponent(this._routeParams, this._rtypeService, this._langService);

  Future<Null> findById() async {
    risktype = await _rtypeService.findById(_id);
  }

  Future<Null> save(rtype) async {
    var response = await _rtypeService.save(rtype);
    if (response != null) {
      addToastEvent.emit(new Toast("success", "Risk Type saved successfuly!"));
    }
  }

  Future<Null> findLanguageOptions() async {
    languages = await _langService.findAll();
  }

  void ngOnInit() {
    _id = _routeParams.get('id');
    findSystemLocale().then((final String locale) {
      currLang = Intl.shortLocale(locale);
    });
    findLanguageOptions();
    findById();
  }
}
