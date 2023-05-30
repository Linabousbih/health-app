import 'package:flutter/material.dart';
import 'api_service.dart';

class MyWidget extends StatelessWidget {
  final APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        apiService.fetchData();
      },
      child: Text('Fetch Data'),
    );
  }
}
