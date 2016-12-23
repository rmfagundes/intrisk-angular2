import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'models/menuitem.dart';
@Component(
  selector: 'navbar',
  templateUrl: './templates/navbar.html',
  directives: const [ROUTER_DIRECTIVES]
)
class NavBarComponent {
  final List<MenuItem> links = [
    new MenuItem("icon-home", "RiskTypes", false, "Tipos de Risco", null)
  ];
}
