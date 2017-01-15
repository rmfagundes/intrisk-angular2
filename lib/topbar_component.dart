import 'dart:async';
import 'package:angular2/core.dart';

import 'models/user.dart';
import 'models/snack.dart';

import 'services/user_services.dart';
import 'services/snack_services.dart';

@Component(
  selector: 'topbar',
  templateUrl: './templates/topbar.html',
  styleUrls: const ['./templates/css/topbar.css'],
)
class TopBarComponent {
  @Input() User user;

  final UserService _userService;
  final SnackService _snackService;

  TopBarComponent(this._userService, this._snackService);

  Future<Null> find() async {
    user = await _userService.find();
  }

  void ngOnInit() {
    find();
  }

  void login() {
    // TEST SNACK BAR
    this._snackService.add(new Snack("info", "Logou!"));
    // Open modal component for login
  }

}
