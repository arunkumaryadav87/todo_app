import 'package:dartz/dartz.dart';
import 'package:todo_app/app/core/usecases/no_param_usecase.dart';
import 'package:todo_app/data/providers/network/api_error.dart';
import 'package:todo_app/domain/entities/todos.dart';
import 'package:todo_app/domain/repositories/todos_repositories.dart';

class ToDosUseCase extends NoParamUseCase{
  final ToDosRepository _repo;
  ToDosUseCase(this._repo);

  @override
  Future<Either<APIError, List<ToDos>>> execute() {
    return _repo.todos();
  }
}