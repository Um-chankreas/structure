import 'dart:convert';

import 'package:sample_project/app/utils/app_log.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  static Future<dynamic> requestApi(String url,
      {String type = "POST", String data = ""}) async {
    AppLog.info("url:$url");
    AppLog.info("url:$data");
    try {
      final response = type == 'POST'
          ? data == ''
              ? await http.post(Uri.parse(url))
              : await http.post(
                  Uri.parse(url),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8'
                  },
                  body: data,
                )
          : await http.get(Uri.parse(url));
      AppLog.info("response code:${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        final obj = jsonDecode(response.body);
        return obj;
      } else {
        return ({
          'status': 'error',
          'msg': 'Code[${response.statusCode}] can not request',
          'response.statusCode': response.statusCode
        });
      }
    } catch (ex) {
      AppLog.error(ex.toString());
      if (ex.toString() == "Connection failed") {
        return ({
          'status': 'warning',
          'msg': 'Connection failed',
          'response.statusCode': 503
        });
      } else {
        return ({
          'status': 'error',
          'msg': ex.toString(),
          'response.statusCode': 503
        });
      }
    }
  }
}
