import 'package:a/config/localDB.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:a/viewModels/authVM.dart';

class ServiceRepo {
  final String authBaseUrl =
      "http://172.29.176.1:8080/api"; // Authentication API
  final String orgBaseUrl = "http://172.29.176.1:8081/api"; // Organization API
  final LocalDatabaseService db = LocalDatabaseService();

  Future<dynamic> requist(
    String endpoint, {
    required String method,
    Map<String, dynamic>? body,
    String? token,
    bool useOrgApi = false, // Default to auth API
    BuildContext? context, // For token refresh
  }) async {
    final baseUrl = useOrgApi ? orgBaseUrl : authBaseUrl;
    final url = Uri.parse('$baseUrl/$endpoint');

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      http.Response response;

      switch (method.toUpperCase()) {
        case 'POST':
          response = await http
              .post(
                url,
                headers: headers,
                body: body != null ? jsonEncode(body) : null,
              )
              .timeout(const Duration(seconds: 15));
          break;
        case 'GET':
          response = await http
              .get(url, headers: headers)
              .timeout(const Duration(seconds: 15));
          break;
        case 'PUT':
          response = await http
              .put(
                url,
                headers: headers,
                body: body != null ? jsonEncode(body) : null,
              )
              .timeout(const Duration(seconds: 15));
          break;
        case 'DELETE':
          response = await http
              .delete(url, headers: headers)
              .timeout(const Duration(seconds: 15));
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      } else if (response.statusCode == 401) {
        print('Unauthorized request (401): ${response.body}');

        // Try to refresh token if context is available and this is not a refresh request
        if (context != null && !endpoint.contains('refresh')) {
          print('Attempting to refresh token due to 401 error...');
          try {
            final authVM = Provider.of<AuthViewModel>(context, listen: false);
            final refreshed = await authVM.refreshAccessToken();

            if (refreshed && authVM.accessToken != null) {
              print('Token refreshed, retrying request...');
              // Retry the request with new token
              final newHeaders = {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer ${authVM.accessToken}',
              };

              http.Response retryResponse;
              switch (method.toUpperCase()) {
                case 'POST':
                  retryResponse = await http
                      .post(
                        url,
                        headers: newHeaders,
                        body: body != null ? jsonEncode(body) : null,
                      )
                      .timeout(const Duration(seconds: 15));
                  break;
                case 'GET':
                  retryResponse = await http
                      .get(url, headers: newHeaders)
                      .timeout(const Duration(seconds: 15));
                  break;
                case 'PUT':
                  retryResponse = await http
                      .put(
                        url,
                        headers: newHeaders,
                        body: body != null ? jsonEncode(body) : null,
                      )
                      .timeout(const Duration(seconds: 15));
                  break;
                case 'DELETE':
                  retryResponse = await http
                      .delete(url, headers: newHeaders)
                      .timeout(const Duration(seconds: 15));
                  break;
                default:
                  return null;
              }

              if (retryResponse.statusCode >= 200 &&
                  retryResponse.statusCode < 300) {
                print('Request succeeded after token refresh');
                return retryResponse.body.isNotEmpty
                    ? jsonDecode(retryResponse.body)
                    : null;
              }
            }
          } catch (e) {
            print('Token refresh failed: $e');
          }
        }

        return null;
      } else {
        print(
          'Request failed with status ${response.statusCode}: ${response.body}',
        );
        return null;
      }
    } catch (error, stack) {
      print('Request error: $error\n$stack');
      return null;
    }
  }
}
