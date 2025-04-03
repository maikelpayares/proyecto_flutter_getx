//import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onTap;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: Checkbox(value: todo.completed, onChanged: (_) => onToggle()),

        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text('ID:${todo.id}| Usuario:${todo.userId}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
