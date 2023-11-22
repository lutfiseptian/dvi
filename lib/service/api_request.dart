import 'dart:convert';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  late final String url;
  late final dynamic body;
  late final dynamic temParams;

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',

    // "Authorization": AppData.token
  };

  Map<String, String> headersT = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // "Authorization": AppData.token
  };

  //api web
  var baseUrl = 'https://kase.dhasatra.com/api/v1/dvi/dev';

  //api app
  // var baseUrl = 'http://kase.dhasatra.com:7078/api/v1/dvi/dev';

  ApiRequest({required this.url, this.body, this.temParams});

  Future<http.Response> get() async {
    return await http
        .get(Uri.parse(baseUrl + url), headers: headers)
        .timeout(Duration(minutes: 3));
  }

  Future<http.Response> post() async {
    print("url ${baseUrl + url}");
    return await http
        .post(Uri.parse(baseUrl + url),
            body: jsonEncode(body), headers: headers)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> patch() {
    return http
        .patch(Uri.parse(baseUrl + url), body: body)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete() async {
    return await http
        .delete(Uri.parse(baseUrl + url),
            body: jsonEncode(body), headers: headers)
        .timeout(Duration(minutes: 3));
  }

  Future<http.Response> postTransaksi() async {
    print(AppData.token);
    print("url ${baseUrl + url}");

    return await http
        .post(Uri.parse(baseUrl + url),
            body: jsonEncode(body), headers: headersT)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> postTransaksi1() async {
    print(AppData.token);
    print("url ${baseUrl + url}");

    return await http
        .post(Uri.parse(baseUrl + url),
            body: jsonEncode(body), headers: headersT)
        .timeout(Duration(minutes: 2));
  }
}
