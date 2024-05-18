import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class ApiService {
  ApiService() {
    print('=== api service constractor');
  }
  Map<String, String> headerData = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Authorization": "Bearer ${preferences.getString('appToken')}"
  };
  Map<String, String> headerData2 = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  
// Retina Soft
  /*----------------------- Registration Provider -----------------------*/
  Future registerProvider(
      {required Map<String, dynamic> registerMapBody}) async {
    //Uri apiUrl = Uri.parse(ApiURL.postRegUserUrl);
    Uri apiUrl = Uri.parse("https://skill-test.retinasoft.com.bd/api/v1/sign-up/store");
    if (kDebugMode) {
      print('ApiService.registration');
      print("apiUrl===$apiUrl");
    }
    try {
      var response = await http.post(apiUrl, headers: headerData2, body: jsonEncode(registerMapBody));
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }
  /*----------------------- verify registration -----------------------*/ 
    Future verifyRegisterProvider(
      {required Map<String, dynamic> verifyMapBody}) async {
    //Uri apiUrl = Uri.parse(ApiURL.postRegUserUrl);
    Uri apiUrl = Uri.parse("https://skill-test.retinasoft.com.bd/api/v1/sign-up/verify-otp-code");
    if (kDebugMode) {
      print('ApiService.verifyOtp');
      print("apiUrl===$apiUrl");
    }
    try {
      var response = await http.post(apiUrl, headers: headerData2, body: jsonEncode(verifyMapBody));
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }
  /*----------------------- verify Login otp Provider -----------------------*/  
  Future sendLoginOtpProvider(
      {required Map<String, dynamic> loginOtpMapBody}) async {
    //Uri apiUrl = Uri.parse(ApiURL.postRegUserUrl);
    Uri apiUrl = Uri.parse("https://skill-test.retinasoft.com.bd/api/v1/send-login-otp");
    if (kDebugMode) {
      print('ApiService.loginOtp');
      print("apiUrl===$apiUrl");
    }
    try {
      var response = await http.post(apiUrl, headers: headerData2, body: jsonEncode(loginOtpMapBody));
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }
    /*----------------------- Login Provider-----------------------*/  
  Future loginProvider(
      {required Map<String, dynamic> loginMapBody}) async {
    //Uri apiUrl = Uri.parse(ApiURL.postRegUserUrl);
    Uri apiUrl = Uri.parse("https://skill-test.retinasoft.com.bd/api/v1/login");
    if (kDebugMode) {
      print('ApiService.loginOtp');
      print("apiUrl===$apiUrl");
    }
    try {
      var response = await http.post(apiUrl, headers: headerData2, body: jsonEncode(loginMapBody));
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }
  /*----------------------- LogOut Provider -----------------------*/  
  Future logOutProvider() async {
    //Uri apiUrl = Uri.parse(ApiURL.postRegUserUrl);
    Uri apiUrl = Uri.parse("https://skill-test.retinasoft.com.bd/api/v1/logout");
    if (kDebugMode) {
      print('ApiService.loginOtp');
      print("apiUrl===$apiUrl");
    }
    try {
      var response = await http.post(apiUrl, headers: headerData);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      return response;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

}
