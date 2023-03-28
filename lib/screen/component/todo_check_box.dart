import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/todo_controller.dart';
import '../../model/todo.dart';

class TodoCheckbox extends StatelessWidget {
  final Todo todo;

  const TodoCheckbox(this.todo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0,
      child: Checkbox(
        shape: const CircleBorder(),
        checkColor: Colors.transparent,
        activeColor: Colors.black,
        value: todo.done,
        onChanged: (value) {
          Get.find<TodoController>().updateDone(value!, todo);
        },
      ),
    );
  }
}
