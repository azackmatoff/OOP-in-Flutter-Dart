import 'dart:io';
import 'package:http/http.dart' as http;

const String baseUrl = "https://reqres.in/api/";

class HttpHelpers {
  Future<http.Response> getClient(String endpoint) async {
    try {
      final String url = '$baseUrl$endpoint';

      final client = http.Client();

      final response = await client.get(
        Uri.parse(url),
      );

      return response;
    } catch (e) {
      throw HttpException(e);
    }
  }

  Future<http.StreamedResponse> getStream(String endpoint) async {
    try {
      final String url = '$baseUrl$endpoint';

      var request = http.Request('GET', Uri.parse(url));

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      throw HttpException(e);
    }
  }
}

final HttpHelpers httpHelper = HttpHelpers();
