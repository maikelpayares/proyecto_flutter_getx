import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:grupo01_getx/data/models/todo_model.dart';
import 'package:grupo01_getx/domain/controllers/todo_controller.dart';
import 'package:grupo01_getx/presentation/widgets/todo_tile.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        actions: [
          IconButton(
            onPressed: controller.fetchTodos,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${controller.error.value}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.fetchTodos,
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          );
        }
        if (controller.todos.isEmpty) {
          return const Center(child: Text('No hay tareas disponibles'));
        }

        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return TodoTile(
              todo: todo,
              onToggle: () => controller.toggleCompleted(index),
              onTap: () {
                Get.snackbar(
                  'Tarea seleccionada',
                  'ID: ${todo.id} - ${todo.title}',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            );
          },
        );
      }),
    );
  }
}
