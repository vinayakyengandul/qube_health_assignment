import 'package:get/get.dart';
import 'package:qube_health_assignment/controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}