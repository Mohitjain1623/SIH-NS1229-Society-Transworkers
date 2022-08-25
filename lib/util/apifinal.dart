import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiCalling {
  final String _baseUrl = "https://pib-portal-api.herokuapp.com/";

  final String signUp = '/api/user/register';

  // Map<String, String> staticHeaders = {
  //   "Accept": "application/json",
  //   "content-type": "application/json",
  //   "srcFrom": "App",
  //   "eventName": "NA",
  // };

  Future<dynamic> createUser(String username, String email, String number,
      String pass) {
    // staticHeaders['eventName'] = 'SIGNUP_REQUEST';

    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   "content-type": "application/json"
    // };
    Map<String, dynamic> body = {
      "username": username,
      "email": email,
      "phoneno": number,
      "password": pass,
    };
    var requestUrl = signUp;

    var responseJson = postReq(requestUrl, body);
    // print('user data:  ' + responseJson.toString());
    return responseJson;
  }

  Future<dynamic> postReq(String endPoint, Map body) async {
    // debugPrint('ApiCalling:: postApi endpoint: ' + endPoint.toString());
    // debugPrint('ApiCalling:: postApi header: ' + header.toString());

    // debugPrint('ApiCalling:: postApi body: ' + body.toString(),
    //      wrapWidth: 1500);

    var responseJson = await postReqChild(endPoint, body);

    return responseJson;
  }

  Future<dynamic> postReqChild(
      String endPoint, Map body) async {
    var responseJson;

    try {
      final response = await http.post(
        Uri.parse(_baseUrl + endPoint),
        body: jsonEncode(body),
      );
      responseJson = _response(response);
    } on SocketException catch (error) {
      print("error Socket: " + error.message);

      // if (error.message == 'Connection failed' ||
      //     error.message == 'No Internet connection' ||
      //     error.message.toString().contains('Failed host lookup:')) {
      //   noInternet();
      // }
      throw Exception('No Internet connection');
    }

    // debugPrint(
    //      'ApiCalling:: postApi response::  API: ' +
    //          endPoint +
    //          ' Val: ' +
    //          responseJson.toString(),
    //      wrapWidth: 1500);
    return responseJson;
  }

  dynamic _response(http.Response response) {
    // print('ApiCalling :: response: ' + response.body.toString());

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //// print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        //// print(responseJson);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.body.toString());
        //// print(responseJson);
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 301:
        var responseJson = json.decode(response.body.toString());
        //// print(responseJson);
        return responseJson;
      case 400:
        throw Exception(response.body.toString());
      case 401:

      case 403:
        throw Exception(response.body.toString());
      case 500:

      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
