import 'package:a/core/config/localDB.dart';
import 'package:a/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ServiceRepo {
  final String authBaseUrl =
      "http://172.20.10.7:8080/api"; // Authentication API
  final String orgBaseUrl = "http://172.20.10.7:8081/api"; // Organization API
  final String appointmentsBaseUrl =
      "http://localhost:8082/api/v1"; // Appointments Microservice

  final LocalDatabaseService db = LocalDatabaseService();

  Future<dynamic> requist(
    String endpoint, {
    required String method,
    Map<String, dynamic>? body,
    String? token,
    bool useOrgApi = false, // Default to auth API
    bool useAppointmentsApi = false, // Use appointments microservice
    BuildContext? context, // For token refresh
  }) async {
    // Determine which base URL to use
    final String baseUrl;
    if (useAppointmentsApi) {
      baseUrl = appointmentsBaseUrl;
    } else if (useOrgApi) {
      baseUrl = orgBaseUrl;
    } else {
      baseUrl = authBaseUrl;
    }

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
        case 'PATCH':
          response = await http
              .patch(
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

      // Handle successful responses (2xx) and partial content (207)
      if ((response.statusCode >= 200 && response.statusCode < 300) ||
          response.statusCode == 207) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      } else if (response.statusCode == 401) {
        print('Unauthorized request (401): ${response.body}');

        // Try to refresh token if context is available and this is not a refresh request
        if (context != null && !endpoint.contains('refresh')) {
          print('Attempting to refresh token due to 401 error...');
          try {
            final authViewModel = Provider.of<AuthViewModel>(
              context,
              listen: false,
            );
            final refreshed = await authViewModel.refreshAccessToken();

            if (refreshed && authViewModel.accessToken != null) {
              print('Token refreshed, retrying request...');
              // Retry the request with new token
              final newHeaders = {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer ${authViewModel.accessToken}',
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
                case 'PATCH':
                  retryResponse = await http
                      .patch(
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
      } else if (response.statusCode == 400) {
        // Handle 400 Bad Request - may contain useful error details (e.g., validation errors, partial failures)
        print('Request failed with status 400: ${response.body}');
        // Try to parse response body as it may contain structured error information
        try {
          if (response.body.isNotEmpty) {
            return jsonDecode(response.body);
          }
        } catch (e) {
          print('Failed to parse 400 response body: $e');
        }
        return null;
      } else if (response.statusCode == 500) {
        // Handle 500 Internal Server Error - return error response so caller can extract error message
        print('Request failed with status 500: ${response.body}');
        try {
          if (response.body.isNotEmpty) {
            return jsonDecode(response.body);
          }
        } catch (e) {
          print('Failed to parse 500 response body: $e');
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
