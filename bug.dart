```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = jsonDecode(response.body);
      print('Data fetched successfully: $jsonData');
    } else {
      // Handle the error
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception, which could be a network error or JSON decoding error
    print('Error fetching data: $e');
    // Re-throw the exception to allow upper layers to handle it if needed
    rethrow; 
  }
}
```