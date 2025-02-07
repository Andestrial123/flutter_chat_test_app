import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) = _ApiClient;

  @POST('/login')
  Future<void> login(@POST("body") String body);
}
