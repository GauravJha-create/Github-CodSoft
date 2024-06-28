class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Workout', isDone: true),
      ToDo(id: '02', todoText: 'College Assignment', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Buy Groceries',
      ),
      ToDo(
        id: '04',
        todoText: 'Learn Flutter',
      ),
      ToDo(
        id: '05',
        todoText: 'Internship Task',
      ),
    ];
  }
}
