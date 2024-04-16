import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/dog.dart';

class DogsApi {
  Client client = Client();
  Future<DogData?> fetchDog() async {
    final uri = Uri.parse('https://dog.ceo/api/breeds/image/random');
    try {
      final response = await client.get(uri);
      final body = jsonDecode(response.body);
      final dog = DogData.fromJson(body);

      return dog;
    } catch (e) {
      return null;
    }
  }
}
