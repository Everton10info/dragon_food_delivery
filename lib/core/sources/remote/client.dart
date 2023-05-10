import 'package:http/http.dart';

class AppClient {
  final httpClient = Client();

  Future<dynamic> get({required String uri}) {
    return httpClient.get(Uri.parse(uri));
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
