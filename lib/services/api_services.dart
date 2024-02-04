import '../models/post_models.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/users')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('users')
  Future<List<UserModel>> getPosts();
}