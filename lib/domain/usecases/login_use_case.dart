import 'package:dartz/dartz.dart';
import 'package:todo_app/app/core/usecases/param_usecase.dart';
import 'package:todo_app/domain/repositories/login_repositories.dart';

class LoginUseCase extends ParamUseCase<bool, Tuple2<String, String>>{
  final LoginRepository _repo;
  LoginUseCase(this._repo);

  @override
  Future<bool> execute(Tuple2 params) {
    return _repo.login(params.value1, params.value2);
  }
}