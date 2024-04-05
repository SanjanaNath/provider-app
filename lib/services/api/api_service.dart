import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/config/api_config.dart';
import '../database/local_database.dart';
import 'exception_handler.dart';

String decodeQueryParameter({required Map<String, String>? body}) {
  String formattedData = '';
  List<String>? bodyList = [];

  if (body != null) {
    body.forEach((key, value) {
      bodyList.add('&$key=$value');
    });
    formattedData = bodyList.join('').replaceFirst('&', '?');
  }

  if (formattedData.isNotEmpty) {
    debugPrint('Query Params are :- $formattedData');
  }
  return formattedData;
}

class ApiService {
  static const int timeOutDuration = 40;

  ///Seconds
  Map<String, String> defaultHeaders() {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocalDatabase().accessToken}',
    };
  }

  ///1) Get Request...

  Future<dynamic> get({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse('$url${decodeQueryParameter(body: queryParameters)}');
    try {
      var response = await http
          .get(uri, headers: headers ?? defaultHeaders())
          .timeout(const Duration(seconds: timeOutDuration));
      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///2) POST Request...

  Future<dynamic> post({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);
    try {
      final response = await http
          .post(uri, headers: headers ?? defaultHeaders(), body: body)
          .timeout(const Duration(seconds: timeOutDuration));
      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///3) PUT Request...

  Future<dynamic> put({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);

    try {
      final response = body == null
          ? await http.put(uri, headers: headers ?? defaultHeaders())
          : await http
              .put(uri, headers: headers ?? defaultHeaders(), body: body)
              .timeout(const Duration(seconds: timeOutDuration));

      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///4) Patch Request...

  Future<dynamic> patch({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);

    try {
      final response = await http
          .patch(uri, headers: headers ?? defaultHeaders(), body: body)
          .timeout(const Duration(seconds: timeOutDuration));

      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///5) MultiPart  Request...

  Future<dynamic> multiPart({
    required String endPoint,
    required Map<String, String> body,
    String? baseUrl,
    Map<String, String>? headers,
    List<MultiPartData>? multipartFile,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      if (multipartFile != null) {
        for (var element in multipartFile) {
          debugPrint('Multipart... Field ${element.field}: FilePath ${element.filePath}');
          if (element.field != null && element.filePath != null) {
            request.files.add(await http.MultipartFile.fromPath('${element.field}', '${element.filePath}'));
          }
        }
      }
      request.headers.addAll(headers ?? defaultHeaders());
      http.StreamedResponse response = await request.send();
      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///5.1) MultiPart  Stream...

// Future<http.StreamedResponse?> uploadWithProgress({
//   required String endPoint,
//   required Map<String, String> body,
//   required List<MultiPartData>? multipartFile,
//   String? baseUrl,
//   Map<String, String>? headers,
//   bool? showError,
//   required Function(int, int) onProgress,
// }) async {
//   String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
//   var uri = Uri.parse(url);
//
//   var request = http.MultipartRequest('POST', uri);
//
//   // Add headers and fields
//   request.headers.addAll(headers ?? defaultHeaders());
//   request.fields.addAll(body);
//
//   if (multipartFile != null) {
//     for (var element in multipartFile) {
//       var file = File(element.filePath);
//       var fileLength = await file.length();
//
//       var stream = http.ByteStream(Stream.castFrom(file.openRead()));
//
//       var multipartFile = http.MultipartFile(
//         element.field,
//         stream,
//         fileLength,
//         filename: element.filePath.split('/').last,
//       );
//
//       // Listen to the upload stream and calculate progress
//       var total = 0;
//       stream.listen(
//         (List<int> chunk) {
//           total += chunk.length;
//           onProgress(total, fileLength);
//           request.sink.add(chunk);
//         },
//         onDone: () {
//           request.sink.close();
//         },
//         onError: (e) {
//           request.;
//         },
//         cancelOnError: true,
//       );
//
//       request.files.add(multipartFile);
//     }
//   }
//
//   try {
//     var response = await request.send();
//     return response;
//   } catch (e, s) {
//     return null;
//   }
// }
}

class MultiPartData {
  MultiPartData({
    required this.field,
    required this.filePath,
  });

  String? field;
  String? filePath;

  factory MultiPartData.fromJson(Map<String, dynamic> json) => MultiPartData(
        field: json['field'],
        filePath: json['filePath'],
      );

  Map<String, dynamic> toJson() => {
        'field': field,
        'filePath': filePath,
      };
}
