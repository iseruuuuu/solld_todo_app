import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../controller/todo_controller.dart';
import '../model/todo.dart';

class TodoAddScreen extends StatefulWidget {
  final String? todoId;

  const TodoAddScreen({Key? key, this.todoId}) : super(key: key);

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

class TodoAddScreenState extends State<TodoAddScreen> {
  final todoController = Get.find<TodoController>();
  final textController = TextEditingController();
  final contentsController = TextEditingController();
  Todo? todo;

  @override
  void initState() {
    super.initState();
    if (widget.todoId != null) {
      todo = todoController.getTodoById(widget.todoId!);
      if (todo != null) {
        textController.text = todo!.description;
        contentsController.text = todo!.contents;
      }
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              final text = textController.text;
              final contents = contentsController.text;
              if (todo == null && text.isNotEmpty) {
                todoController.addTodo(text, contents);
              } else if (todo != null) {
                todoController.updateText(text, todo!, contents);
              }
              Get.back();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                const Spacer(),
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'タイトルの入力',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 5),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: contentsController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '内容の入力',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4),
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  maxLines: 10,
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
