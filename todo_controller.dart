import 'package:get/get.dart';
import 'package:grupo01_getx/data/models/todo_model.dart';
import 'package:grupo01_getx/data/repositories/todo_repository.dart';

class TodoController extends GetxController {
  final TodoRepository repository = TodoRepository();

  //variables
  final RxList todos = [].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future fetchTodos() async {
    try {
      isLoading.value = true;
      error.value = '';

      final fetchTodos = await repository.getTodos();
      todos.assignAll(fetchTodos);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void toggleCompleted(int index) {
    final todo = todos[index];

    todos[index] = Todo(
      userId: todo.userId,
      id: todo.id,
      title: todo.title,
      completed: !todo.completed,
    );
  }
}
