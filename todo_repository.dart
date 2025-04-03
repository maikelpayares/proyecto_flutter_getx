import 'dart:convert';
//import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/todo_model.dart';

class TodoRepository {
  final String baseurl = 'https://jsonplaceholder.typicode.com';
  Future getTodos() async {
    try {
      final response = await http.get(Uri.parse('$baseurl/todos'));
      if (response.statusCode == 200) {
        final List jsonList = json.decode(response.body);
        return jsonList.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('ERROR AL CARGAR TAREAS:${response.statusCode}');
      }
    } catch (e) {
      throw Exception('ERROR dDE CONEXION:$e');
    }
  }

  Future getTodoById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseurl/todos/$id'));
      if (response.statusCode == 200) {
        return Todo.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error de conexion:${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexion:$e');
    }
  }
}
