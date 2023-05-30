import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<List<Map<String, String>>> fetchData() async {
    final url = 'https://awtufifg0h.execute-api.eu-west-2.amazonaws.com/prod/products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final productsData = jsonData['products'];

        final List<Map<String, String>> parsedData = [];

        for (final product in productsData) {
          final price = product['price'];
          final productId = product['productId'];
          final color = product['color'];

          parsedData.add({
            'price': price ?? '',
            'productId': productId ?? '',
            'color': color ?? '',
          });
        }

        return parsedData;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
