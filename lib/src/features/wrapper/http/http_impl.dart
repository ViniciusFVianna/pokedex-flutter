import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'custom_client_http.dart';
import 'custom_http_response.dart';

class HttpImpl implements CustomClientHttp {
  final http.Client httpClient;

  HttpImpl({required this.httpClient});

  @override
  Future<CustomHttpResponse> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    var response =
        await httpClient.get(uri, headers: headers ?? await _header(headers));
    return CustomHttpResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      body: _toMap(response.bodyBytes),
      uri: uri,
    );
  }

  @override
  Future<CustomHttpResponse> post(
    Uri uri, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final header = headers ?? await _header(headers);
    var response = await httpClient.post(
      uri,
      headers: header,
      body: jsonEncode(body),
    );
    return CustomHttpResponse(
      request: body as Map<String, dynamic>,
      statusCode: response.statusCode,
      headers: response.headers,
      body: _toMap(response.bodyBytes),
      uri: uri,
    );
  }

  @override
  Future<CustomHttpResponse> put(
    Uri uri, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    var response = await httpClient.put(
      uri,
      headers: headers ?? await _header(headers),
      body: jsonEncode(body),
    );
    return CustomHttpResponse(
      request: body as Map<String, dynamic>,
      statusCode: response.statusCode,
      headers: response.headers,
      body: _toMap(response.bodyBytes),
      uri: uri,
    );
  }

  @override
  Future<CustomHttpResponse> delete(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    var response = await httpClient.delete(uri,
        headers: headers ?? await _header(headers));
    return CustomHttpResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      body: _toMap(response.bodyBytes),
      uri: uri,
    );
  }

  Future<Map<String, String>> _header(Map<String, String>? headers) async {
    var defaultHeader = {
      'Content-Type': 'application/json',
    };

    return headers ?? defaultHeader;
  }

  Map<String, dynamic> _toMap(Uint8List bodyBytes) {
    try {
      return jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>;
    } catch (e) {
      return jsonDecode('{"result": ${utf8.decode(bodyBytes)}}')
          as Map<String, dynamic>;
    }
  }
}
