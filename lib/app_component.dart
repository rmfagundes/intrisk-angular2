import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'navbar_component.dart';
import 'topbar_component.dart';
import 'risktypes_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: './templates/app.html',
    directives: const [TopBarComponent, NavBarComponent, RiskTypesComponent,
                       ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(path: '/risktypes', name: 'RiskTypes', component: RiskTypesComponent)
])
class AppComponent {
}
