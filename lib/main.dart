import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>>? _data;
  final APIService apiService = APIService();

  Future<void> _fetchData() async {
    try {
      final data = await apiService.fetchData();
      setState(() {
        _data = data;
      });
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        _data = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Fetched Data:'),
            if (_data != null)
              Column(
                children: [
                  for (final item in _data!)
                    Text(
                      'Product ID: ${item['productId'] ?? ''}, Price: ${item['price'] ?? ''}, Color: ${item['color'] ?? ''}',
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
            if (_data == null)
              Text(
                'No data fetched.',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        tooltip: 'Fetch Data',
        child: const Icon(Icons.download),
      ),
    );
  }
}
