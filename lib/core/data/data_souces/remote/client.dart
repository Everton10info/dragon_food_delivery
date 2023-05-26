import 'package:http/http.dart';

class AppClient {
  final httpClient = Client();

  Future<dynamic> get({
    required String uri,
    required Map<String, String> headers,
  }) {
    return httpClient.get(
        Uri.parse(
          uri,
        ),
        headers: headers);
  }

  Future<dynamic> post({
    required String uri,
    required Map<String, String> headers,
    required dynamic body,
  }) {
    return httpClient.post(
      Uri.parse(uri),
      headers: headers,
      body: body,
    );
  }
}
