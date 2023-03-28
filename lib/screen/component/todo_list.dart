import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/todo_controller.dart';
import '../../model/todo.dart';
import '../todo_add_screen.dart';
import 'todo_check_box.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(TodoAddScreen(todoId: todo.id));
      },
      leading: TodoCheckbox(todo),
      title: Text(
        todo.description,
        style: todo.done
            ? const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.find<TodoController>().remove(todo);
        },
        icon: const Icon(
          Icons.delete,
          size: 25,
          color: Colors.grey,
        ),
      ),
    );
  }
}
