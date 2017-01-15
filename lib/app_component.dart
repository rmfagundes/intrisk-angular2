import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'navbar_component.dart';
import 'topbar_component.dart';
import 'snack_component.dart';
import 'risktypes_component.dart';
import 'risktype_detail_component.dart';

import 'services/snack_services.dart';
import 'services/user_services.dart';

@Component(
    selector: 'my-app',
    templateUrl: './templates/app.html',
    directives: const [TopBarComponent, NavBarComponent, SnackComponent,
                       RiskTypesComponent, RiskTypeDetailComponent,
                       ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS, SnackService, UserService])
@RouteConfig(const [
  const Route(path: '/risktypes', name: 'RiskTypes', component: RiskTypesComponent),
  const Route(path: '/risktype/:id', name: 'RiskType', component: RiskTypeDetailComponent)
])
class AppComponent {
  final UserService _userService;
  final SnackService _snackService;

  AppComponent(this._snackService, this._userService);
}
