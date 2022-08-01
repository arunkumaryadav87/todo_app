import 'dart:convert';

import 'package:conduit_codable/conduit_codable.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/domain/entities/user.dart';
import 'package:todo_app/domain/repositories/login_repositories.dart';

class LoginRepositoriesImpl extends LoginRepository {
  @override
  Future<bool> login(String username, String password) async {
    var jsonText =
    await rootBundle.loadString('assets/mock/auth.json');
    final result = json.decode(jsonText);
    final archive = KeyedArchive.unarchive(result);
    User user = User()..decode(archive);
    return user.user == username && user.pass == password;
  }
}
