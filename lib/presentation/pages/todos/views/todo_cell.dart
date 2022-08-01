import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/config/custom_styles.dart';
import 'package:todo_app/app/utils/dimensions.dart';
import 'package:todo_app/domain/entities/todos.dart';
import 'package:todo_app/presentation/controllers/todos/todos_controller.dart';

class ToDosCell extends StatelessWidget {
  final ToDos todos;

  const ToDosCell({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.standardMargin,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(Dimensions.standardMargin)),
        ),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.smallMargin, vertical: Dimensions.standardMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    '${todos.userId}',
                    style: CustomStyles.textStyle,
                  ),
                ),
              ),
            ),
            SizedBox(width: Dimensions.smallMargin,),
            Expanded(
              flex: 4,
              child: Text(
                '${todos.title}',
                style: CustomStyles.textStyle.copyWith(fontSize: Dimensions.mediumTextSize),
              ),
            ),
            SizedBox(width: Dimensions.smallMargin,),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print("Title: ${todos.title}");
                  print("Id: ${todos.id}");
                  Get.find<ToDosController>().updateTaskStatus(todos);
                },
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: Icon(
                    Icons.check,
                    size: 26,
                    color: todos.completed ?? false ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
