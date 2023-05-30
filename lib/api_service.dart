import 'package:http/http.dart' as http;

class APIService {
  Future<String?> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://awtufifg0h.execute-api.eu-west-2.amazonaws.com/prod/products'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}

