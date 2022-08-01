import 'package:todo_app/data/providers/network/api_endpoint.dart';
import 'package:todo_app/data/providers/network/api_provider.dart';
import 'package:todo_app/data/providers/network/api_request_representable.dart';

class ToDosAPI implements APIRequestRepresentable {

  ToDosAPI.fetchToDos();

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.todosapi;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => "/todos";

  @override
  Map<String, String>? get query => null;

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;

}