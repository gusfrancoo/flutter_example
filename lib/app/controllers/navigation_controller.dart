import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxString appBarTitle = 'Home'.obs;
  // final box = GetStorage(); // Instância do GetStorage



  void changePage(int index) {
    selectedIndex.value = index;

    switch (selectedIndex.value) {
      case 0:
        appBarTitle.value = 'Home';
        return;
      case 1:
        appBarTitle.value = 'Adicionar Produto';
        return;
      case 2:
        appBarTitle.value = 'Listar Produtos';
        return;
    }
  }
  
}