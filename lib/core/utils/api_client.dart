import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_urls.dart';
import '../constants/enums.dart';

class ApiClient {
  late Dio _dio;
  String? _token;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      responseType:
          ResponseType.json, // Consider using json for automatic parsing
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add token to headers if available
        if (_token != null) {
          options.headers['Authorization'] = 'Bearer $_token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        // Global error handling
        print('API Call failed: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  Future<Response> apiCall({
    required ApiMethod method,
    required String endpoint,
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, String>? queryParams,
  }) async {
    final url = _buildUrl(ApiConstants.baseUrl, endpoint, queryParams);
    try {
      return await _makeRequest(method, url, data ?? {}, formData);
    } on DioException catch (e) {
      // Handle specific DioErrors if necessary
      throw Exception(
          'API call failed: ${e.response?.statusCode} ${e.message}');
    }
  }

  String _buildUrl(
      String baseUrl, String endpoint, Map<String, String>? queryParams) {
    var url = baseUrl + endpoint;
    if (queryParams != null) {
      url += '?${Uri(queryParameters: queryParams).query}';
    }
    return url;
  }

  Future<Response> _makeRequest(ApiMethod method, String url,
      Map<String, dynamic> data, FormData? formData) async {
    switch (method) {
      case ApiMethod.get:
        return await _dio.get(url, queryParameters: data);
      case ApiMethod.post:
        return await _dio.post(url, data: formData ?? data);
      case ApiMethod.patch:
        return await _dio.patch(url, data: formData ?? data);
      default:
        throw UnsupportedError('Unsupported HTTP method');
    }
  }
}
