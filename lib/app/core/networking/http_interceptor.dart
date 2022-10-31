// ignore_for_file: non_constant_identifier_names, always_put_control_body_on_new_line

import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:jualin_flutter_3/app/core/networking/http.dart';

import 'http_exception.dart';

Outcome ErrorInterceptorHandling({dynamic response, required Outcome result, String? url}) {
  response as Response<dynamic>;
  result.isFailure = true;
  result.statusCode = response.statusCode;
  result.errorBody = response.body;

  logW('${response.statusCode} | ${response.bodyString}');

  switch (response.statusCode) {
    case 400:
      result.errorMessages = response.body['message']; // commonly
      throw ApiException(result.errorMessages);
    case 401:
      result.errorMessages = 'Session anda telah habis, silahkan masuk kembali (401)';
      throw ApiException(result.errorMessages);
    case 403:
      result.errorMessages = 'Access Forbidden (403)';
      throw ApiException(result.errorMessages);
    case 404:
      result.errorMessages = 'Path tidak ditemukan (404)';
      throw ApiException(result.errorMessages);
    case 405:
      result.errorMessages = 'Method not allowed (405)';
      throw ApiException(result.errorMessages);
    case 422:
      try {
        result.errorMessages = response.body['detail'][0]['msg']; // pesan error validasi
      } catch (e) {
        result.errorMessages = response.body['message']; // commonly
      }
      throw ApiException(result.errorMessages);
    case 500:
      result.errorMessages = 'Internal Server Error (500)';
      throw ApiException(result.errorMessages);
    case 503:
      result.errorMessages = 'Service Unavailable (503)';
      throw ApiException(result.errorMessages);
    default: // offline
      result.errorMessages = 'Tidak dapat terhubung ke server.';
      throw ApiException(result.errorMessages);
  }
}
