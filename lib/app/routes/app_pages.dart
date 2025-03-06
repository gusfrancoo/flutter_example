import 'package:flutter_faculdade/app/controllers/addProdutos_controller.dart';
import 'package:flutter_faculdade/app/controllers/navigation_controller.dart';
import 'package:flutter_faculdade/app/controllers/listProdutos_controller.dart';
import 'package:flutter_faculdade/app/routes/app_routes.dart';
import 'package:flutter_faculdade/app/screens/addProdutos_screen.dart';
import 'package:flutter_faculdade/app/screens/home_screen.dart';
import 'package:flutter_faculdade/app/screens/listProdutos.screen.dart';
import 'package:flutter_faculdade/app/screens/login_screen.dart';
import 'package:flutter_faculdade/utils/widgets/global_scaffold.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.globalScaffold,
      page: () => GlobalScaffold(),
      binding: BindingsBuilder(() {
        Get.put(NavigationController(), permanent: true);
        Get.lazyPut(() => AddProdutosController(), fenix: true);
        Get.lazyPut(() => ListprodutosController(), fenix: true);
      },),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.addProduto,
      page: () => AddprodutosScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AddProdutosController()))
    ),
    GetPage(
      name: AppRoutes.listProdutos,
      page: () => ListProdutosScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ListprodutosController()))
    ),
  ];
}