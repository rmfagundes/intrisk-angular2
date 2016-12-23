import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:intrisk_angular2/app_component.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';

void main() {
  bootstrap(AppComponent, [
    provide(Client, useFactory: () => new BrowserClient(), deps: [])
  ]);
}
