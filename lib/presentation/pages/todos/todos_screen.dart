import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/config/custom_styles.dart';
import 'package:todo_app/app/utils/dimensions.dart';
import 'package:todo_app/app/config/string_constants.dart';
import 'package:todo_app/presentation/controllers/todos/todos_controller.dart';
import 'package:todo_app/presentation/pages/todos/views/todo_cell.dart';

class ToDoListScreen extends GetView<ToDosController> {
  ToDoListScreen({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    debugPrint("to do screen rebuilt");
    debugPrint("todo count: ${controller.todos.length}");
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(StringConstants.todolist),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: Dimensions.standardMargin),
                child: GestureDetector(
                  onTap: () => controller.logout(),
                  child: const Icon(
                    Icons.logout,
                    size: 26.0,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.standardMargin),
            child: Column(
              children: [
                TextField(
                  style: CustomStyles.textStyle.copyWith(
                    fontSize: Dimensions.mediumTextSize,
                  ),
                  onChanged: (value) => controller.filter(value),
                  decoration: InputDecoration(
                    labelText: StringConstants.search,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: Dimensions.standardMargin,
                ),
                Expanded(
                  child: controller.todos.isNotEmpty
                      ? ListView.builder(
                          controller: _scrollController,
                          itemCount: controller.todos.length,
                          itemBuilder: (context, index) {
                            final todo = controller.todos[index];
                            return GestureDetector(
                              onTap: () {
                                debugPrint("selected todo: ${todo.title}");
                              },
                              child: ToDosCell(
                                todos: todo,
                              ),
                            );
                          },
                        )
                      : Text(
                          StringConstants.noResultsFound,
                          style:
                              TextStyle(fontSize: Dimensions.standardTextSize),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
