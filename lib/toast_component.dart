import 'dart:async';
import 'dart:math';
import 'package:angular2/core.dart';

import 'models/toast.dart';

import 'services/toast_services.dart';

@Component(
  selector: 'toast',
  templateUrl: './templates/toast.html',
  styleUrls: const ['./templates/css/toast.css'],
  providers: const[ToastService]
)
class ToastComponent implements OnInit {
  List<Toast> toasts;

  final ToastService _toastService;

  ToastComponent(this._toastService);

  Future<Null> findAll() async {
    toasts = await _toastService.findAll();
  }

  void ngOnInit() {
    findAll();
  }

  void onAddToastEvent(nuToast) {
    print('CAPTEI');
    toasts = this._toastService.add(nuToast);
  }

  void dismissToast(id) {
    var remToast;
    for (toast in toasts) {
      if (toast.id == id) {
        remToast = toast;
        break;
      }
    }
    toasts = this._toastService.remove(remToast);
  }
}
