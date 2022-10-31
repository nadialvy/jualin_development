// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:http/http.dart' as uploadgoogle;

import '../../helper/pref_helper.dart';
import 'http_exception.dart';
import 'http_interceptor.dart';

part 'http_outcome.dart';

class HttpService extends GetConnect {
  HttpService({
    required this.baseURL,
    required this.baseHeader,
    required this.maxTimeOut,
    this.allowAutoSignedCertificate = true,
    this.useUserAgent = false,
    this.customUserAgent = 'ex-api',
    this.allowFollowRedirects = false,
    this.maxRedirectURL = 3,
    this.maxAuthRetry = 3,
    this.showLogHeader = kDebugMode,
    this.showLogResponse = kDebugMode,
  });

  final String baseURL;
  final Map<String, String> baseHeader;
  final bool allowAutoSignedCertificate;
  final String customUserAgent;
  final bool useUserAgent;
  final bool allowFollowRedirects;
  final int maxRedirectURL;
  final int maxAuthRetry;
  final Duration maxTimeOut;
  final bool showLogHeader;
  final bool showLogResponse;

  @override
  Future<void> onInit() async {
    HttpOverrides.global = MyHttpOverrides(); // Fix Http Issue on Android SDK < 23

    try {
      allowAutoSignedCert = allowAutoSignedCertificate;
      httpClient
        ..baseUrl = baseURL
        ..errorSafety = true
        ..followRedirects = allowFollowRedirects
        ..timeout = maxTimeOut
        ..maxAuthRetries = maxAuthRetry
        ..maxRedirects = maxRedirectURL
        ..sendUserAgent = useUserAgent
        ..userAgent = customUserAgent
        ..addRequestModifier<void>((request) async {
          final token = PrefHelper.userToken;
          if (token != null && token.isNotEmpty) {
            request.headers['Authorization'] = 'Bearer $token';
          }
          request.headers.addAll(baseHeader);
          return request;
        })
        ..addResponseModifier((request, response) async => response)

        /// if (401) -> AUTO REFRESH TOKEN
        ..addAuthenticator<void>((request) async {
          if (PrefHelper.userRefreshToken.isNotNullOrEmpty) {
            final response = await httpPost(
              endPoint: '/user/v1.0/renew-token',
              body: {
                'refresh_token': '${PrefHelper.userRefreshToken}',
              },
            );
            final token = response.body['data']['access_token'];
            final rToken = response.body['data']['refresh_token'];
            final gToken = response.body['data']['google_token'];

            await PrefHelper.setUserToken(token);
            await PrefHelper.setUserRefreshToken(rToken);
            await PrefHelper.setUserGoogleToken(gToken);

            // re-adjust headers ...
            request.headers['Authorization'] = '$token';
            logI('TOKEN REFRESHED!');
          }
          return request;
        });
    } on Exception {
      throw ApiException('Please Inject APIService on your DI');
    }
    super.onInit();
  }

  Future<Outcome> http({required Method method, required String url, Map<String, String>? header, Map<String, String>? query, Map<String, dynamic>? body}) async {
    final result = Outcome();
    await onInit();
    httpClient.baseUrl = '';

    Response res;
    switch (method) {
      case Method.GET:
        res = await get(url, query: query, headers: header);
        break;
      case Method.POST:
        res = await post(url, body, headers: header);
        break;
      case Method.PUT:
        res = await put(url, body, headers: header);
        break;
      case Method.DELETE:
        res = await delete(url, headers: header);
        break;
    }

    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, showResponse: showLogResponse);
    if (res.isOk) {
      result
        ..body = res.body
        ..isFailure = false;
      return result;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl} | $url');
    }
  }

  Future<Outcome> httpGet({required String endPoint, Map<String, dynamic>? query, Map<String, String>? header, bool withToken = true}) async {
    await onInit();
    final result = Outcome();
    final res = await get(endPoint, query: query, headers: header);
    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, query: query, showResponse: showLogResponse);

    if (res.isOk) {
      return result
        ..body = res.body
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl}$endPoint');
    }
  }

  Future<Outcome> httpPost({String endPoint = '', dynamic body, Map<String, String>? header, bool withToken = true}) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.post(endPoint, body: body, headers: header);
    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, body: body, showResponse: showLogResponse);

    if (res.isOk) {
      return result
        ..body = res.body
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl}$endPoint');
    }
  }

  Future<Outcome> httpPut({String endPoint = '', dynamic body, Map<String, String>? header, bool withToken = true}) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.put(endPoint, body: body);
    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, body: body, showResponse: showLogResponse);

    if (res.isOk) {
      return result
        ..body = res.body
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl}$endPoint');
    }
  }

  Future<Outcome> httpDelete({String endPoint = '', Map<String, String>? header, bool withToken = true}) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.delete(endPoint);
    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, showResponse: showLogResponse);

    if (res.isOk) {
      return result
        ..body = res.body
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl}$endPoint');
    }
  }

  Future<Outcome> httpUploadMultipart({String endPoint = '', Map<String, String>? header, required File file, String? fileName, bool withToken = true}) async {
    await onInit();
    final result = Outcome();

    final form = FormData({'file': MultipartFile(file, filename: fileName ?? '')});
    final res = await post(endPoint, form);
    await ApiUtils.apiLog(response: res, showHeader: showLogHeader, showResponse: showLogResponse);

    if (res.isOk) {
      result.body = res.body;
      result.isFailure = false;
      return result;
    } else {
      return ErrorInterceptorHandling(response: res, result: result, url: '${httpClient.baseUrl} | $endPoint');
    }
  }

  Future<void> httpUploadToGoogleStorage({required String url, required File file, String? filename, Map<String, String>? header, String? contentType}) async {
    final uri = Uri.parse(url);
    await uploadgoogle.put(
      uri,
      headers: {'Content-Type': contentType!},
      body: await file.readAsBytes(),
    );
    logI('upload google done with filename: $filename');
  }

  @override
  void onReady() {
    logW('Api Service Ready!');
    super.onReady();
  }

  @override
  void onClose() {
    logW('Api Service Closed!');
    super.onClose();
  }
}

enum Method { GET, POST, PUT, DELETE }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

/// Helper class
mixin ApiUtils {
  static Future<void> apiLog({
    bool? showHeader,
    bool? showResponse,
    Map<String, dynamic>? query,
    dynamic body,
    required Response<dynamic> response,
  }) async {
    // output += '—————————————————————————————————————————————————————————————————————————————\n';
    log('${response.request?.method ?? '-'} | ${response.request?.url ?? '-'} | ${response.statusCode ?? '-'}');

    if (showHeader == true) log('header : ${jsonEncode(response.request?.headers)}');

    try {
      if (query != null) log('query : ${jsonEncode(query)}');
    } catch (e) {
      if (query != null) log('query : $query');
    }

    try {
      if (body != null) log('body : ${jsonEncode(body)}');
    } catch (e) {
      if (body != null) log('body : $body');
    }

    try {
      if (response.isOk && showResponse == true) {
        logI('${response.bodyString}');
      }
    } on Exception catch (e) {
      log(e);
    }
  }
}
