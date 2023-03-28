import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/todo.dart';
import '../screen/search_image_screen.dart';
import '../screen/todo_add_screen.dart';
import '../service/storage_service.dart';
import 'filter_controller.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;
  final _storage = TodoStorage();
  late final Worker _worker;
  late RxString backgroundImages = ''.obs;
  final picker = ImagePicker();
  RxInt pickerColor = 0xff060606.obs;

  @override
  void onInit() {
    super.onInit();
    final storageTodos =
        _storage.load()?.map((json) => Todo.fromJson(json)).toList();
    final initialTodos = storageTodos ?? Todo.initialTodos;
    _todos.addAll(initialTodos);

    _worker = ever<List<Todo>>(_todos, (todos) {
      final data = todos.map((e) => e.toJson()).toList();
      _storage.save(data);
    });
    _loadBackgroundImage();
  }

  _loadBackgroundImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String imagePath = prefs.getString('backgroundImage') ??
        'https://beiz.jp/images_T/white/white_00081.jpg';
    backgroundImages.value = imagePath;
  }

  Future pickImageFromGallery() async {
    Get.to(() => const SearchImageScreen())?.then((value) {
      _saveBackgroundImage(value);
      backgroundImages.value = value;
    });
  }

  _saveBackgroundImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('backgroundImage', imagePath);
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  List<Todo> get todos {
    final hideDone = Get.find<FilterController>().hideDone;
    if (hideDone) {
      return _todos.where((todo) => todo.done == false).toList();
    } else {
      return _todos;
    }
  }

  int get countUndone {
    return _todos.fold<int>(0, (acc, todo) {
      if (!todo.done) {
        acc++;
      }
      return acc;
    });
  }

  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null; // 該当IDがなければnullを返す
    }
  }

  void addTodo(
    String description,
    String contents,
  ) {
    final todo = Todo(
      description: description,
      contents: contents,
    );
    _todos.add(todo);
  }

  void updateText(String description, Todo todo, String contents) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(
      description: description,
      contents: contents,
      colorCode: pickerColor.value,
    );
    _todos.setAll(index, [newTodo]);
  }

  void updateDone(bool done, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(done: done);
    _todos.setAll(index, [newTodo]);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }

  void deleteDone() {
    _todos.removeWhere((e) => e.done == true);
  }

  void onTapAdd() {
    Get.to(() => const TodoAddScreen());
  }
}
