import 'package:http/http.dart';

abstract class AppHttpClient {
  Future<dynamic> request(
      Client client, String url, String method, Map? body, Map? headers);
}
