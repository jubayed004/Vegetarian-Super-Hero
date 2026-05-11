import 'package:get/get.dart';

class NavController extends GetxController {
  static NavController get to => Get.find();
  
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  
  void changeIndex(int index) {
    _selectedIndex.value = index;
  }
}
