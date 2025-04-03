class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
