import 'package:dartz/dartz.dart';
import 'package:todo_app/data/providers/network/api_error.dart';
import 'package:todo_app/domain/entities/todos.dart';

abstract class ToDosRepository {
  Future<Either<APIError, List<ToDos>>> todos();
}