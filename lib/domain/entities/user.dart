import 'package:conduit_codable/conduit_codable.dart';

class User extends Coding {
  String? user;
  String? pass;

  @override
  void encode(KeyedArchive object) {
    object.encode("user", user);
    object.encode("pass", pass);
  }

  @override
  void decode(KeyedArchive object) {
    super.decode(object);
    user = object.decode("user");
    pass = object.decode("pass");
  }
}