import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:todo_app/data/providers/network/api_error.dart';
import 'package:todo_app/data/providers/network/apis/todos_api.dart';
import 'package:todo_app/domain/entities/todos.dart';
import 'package:todo_app/domain/repositories/todos_repositories.dart';

class ToDosRepositoriesImpl extends ToDosRepository {
  @override
  Future<Either<APIError, List<ToDos>>> todos() async {
    Response response = await ToDosAPI.fetchToDos().request();
    if (response.statusCode == HttpStatus.ok) {
      List<ToDos> todosList = toDosFromJson(response.bodyString!);
      return Right(todosList);
    } else {
      return Left(APIError(response.statusText, response.statusCode!));
    }
  }
}
