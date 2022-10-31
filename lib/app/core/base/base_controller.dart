import 'package:get/get.dart';

/// [documentation]
/// bikin sebuah param object generic <T> untuk mengikat setiap 1 [controller] harus punya 1 [repository]
/// sifatnya optional, object T akan di init instansinya ketika parameternya diisi.
/// contoh jadi nya ada di fitur [authentication.login].
abstract class BaseController<T> extends GetxController {
  T get repo => GetInstance().find<T>()!;

  // crashlytic
  // final crash = FirebaseCrashlytics.instance;
}
