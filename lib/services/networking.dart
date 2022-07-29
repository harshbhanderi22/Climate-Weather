import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Networking(this.url);

  final String url;

  Future<void> networkData() async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
