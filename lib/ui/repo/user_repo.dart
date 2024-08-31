import 'dart:convert';
import 'package:assignment/constants/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  /// Sends a login request to the server with the provided [username] and [password].
  ///
  /// Returns `true` if the login is successful and the user is authenticated,
  /// otherwise returns `false`.
  Future<bool> login(String username, String password) async {
    try {
      // Perform a POST request to the login API endpoint
      final response = await http.post(
        Uri.parse(loginApi),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          'username': username,
          'password': password,
        },
      );

      // Check if the server responded with a success status code (200)
      if (response.statusCode == 200) {
        // Decode the JSON response from the server
        final responseData = json.decode(response.body);

        // Check if the login status in the response data is 'success'
        if (responseData['status'] == 'success') {
          // Save the authentication state in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isAuthenticated', true);
          return true; // Login successful
        } else {
          // Print error details from the response data if login failed
          print('Login failed: ${responseData['errors']}');
          return false; // Login failed
        }
      } else {
        // Print server error details if the status code is not 200
        print('Server error: ${response.statusCode}');
        return false; // Login failed
      }
    } catch (e) {
      // Print any exceptions that occur during the request
      print('Exception occurred: $e');
      return false; // Login failed
    }
  }
}
