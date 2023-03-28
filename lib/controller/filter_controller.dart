import 'package:get/get.dart';
import '../service/storage_service.dart';

class FilterController extends GetxController {
  final _hideDone = false.obs;

  final _storage = FilterStorage();
  late final Worker _worker;

  bool get hideDone => _hideDone.value;

  void toggleHide() {
    _hideDone.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    _hideDone.value = _storage.load() ?? false;
    _worker = ever<bool>(_hideDone, (value) {
      _storage.save(value);
    });
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }
}
