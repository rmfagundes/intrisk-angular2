import 'dart:async';
import 'package:angular2/core.dart';

import 'models/snack.dart';

import 'services/snack_services.dart';

@Component(
  selector: 'snack',
  templateUrl: './templates/snack.html',
  styleUrls: const ['./templates/css/snack.css'],
  providers: const[]
)
class SnackComponent implements OnInit, DoCheck{
  @Input() Snack snack;

  final SnackService _snackService;

  SnackComponent(this._snackService);

  Future<Null> find() async {
    snack = await _snackService.find();
  }

  void ngOnInit() {
    find();
  }

  void ngDoCheck() {
    Snack nuSnack = _snackService.current();
    if (snack != nuSnack) {
      if (snack != null) {
        dismissSnackbar();
      }
      snack = nuSnack;
    }
  }

  void dismissSnackbar() {
    snack = null;
  }
}
