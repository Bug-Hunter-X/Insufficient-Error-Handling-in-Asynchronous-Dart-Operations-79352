```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // Provide more context in the exception
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: ${e.message}');
    return null; // Or throw a custom network exception
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: ${e.message}');
    return null; // Or throw a custom JSON exception
  } catch (e) {
    // Handle other unexpected errors
    print('Unexpected error: $e');
    return null; 
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```