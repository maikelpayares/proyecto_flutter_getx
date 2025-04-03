import 'package:get/get.dart';
import 'package:grupo01_getx/presentation/pages/todo_list_page.dart';

class AppRoutes {
  static final routes = [GetPage(name: '/', page: () => const TodoListPage())];
}
