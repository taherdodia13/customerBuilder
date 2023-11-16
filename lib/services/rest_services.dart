import 'dart:io';

import 'package:cutomer_builder/models/create_customer_model.dart';
import 'package:http/http.dart' as http;

import '../utils/exports.dart';

enum Method { post, get, put, delete }

class RestService extends GetConnect {
  static Future<http.Response> getResponse({
    String? path,
    Method? method,
    String? body,
  }) async {
    http.Response response;
    if (method == Method.post || method == Method.put) {
      debugPrint(path!);
      if (method == Method.post) {
        response = await http.post(
          Uri.parse(ServiceConfiguration.baseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: body,
        );
      } else {
        response = await http.put(
          Uri.parse(ServiceConfiguration.baseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: body,
        );
      }
    } else if (method == Method.delete) {
      response = await http.delete(
        Uri.parse(ServiceConfiguration.baseUrl + path!),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } else {
      debugPrint(path!);
      response = await http.get(
        Uri.parse(ServiceConfiguration.baseUrl + path),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    }

    return response;
  }

  Future<UserListResponseModel> userList() async {
    UserListResponseModel result = UserListResponseModel();
    try {
      var response = await getResponse(
        path: ServiceConfiguration.login,
        method: Method.get,
      );
      if (response.statusCode == HttpStatus.ok) {
        result = UserListResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<GetDataResponseModel> getData() async {
    GetDataResponseModel result = GetDataResponseModel();
    try {
      var response = await getResponse(
        path: ServiceConfiguration.customerData,
        method: Method.get,
      );
      if (response.statusCode == HttpStatus.ok) {
        result = GetDataResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<GetDataResponseModel> deleteCustomer(int id) async {
    GetDataResponseModel result = GetDataResponseModel();
    try {
      var response = await getResponse(
        path: '${ServiceConfiguration.customerData}/$id',
        method: Method.delete,
      );
      if (response.statusCode == 204) {
        // result = GetDataResponseModel.fromJson(json.decode(response.body));
        debugPrint('Customer Deleted');
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<SignUpResponseModel> signup(SignUpInputModel value) async {
    SignUpResponseModel result = SignUpResponseModel();
    try {
      var response = await getResponse(
        path: ServiceConfiguration.signUp,
        method: Method.post,
        body: json.encode(value),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        result = SignUpResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<UserListResponseModel> login() async {
    UserListResponseModel result = UserListResponseModel();
    try {
      var response = await getResponse(
        path: ServiceConfiguration.signUp,
        method: Method.get,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        result = UserListResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<CreateCustomerResponseModel> createCustomer(
      CreateCustomerInputModel value) async {
    CreateCustomerResponseModel result = CreateCustomerResponseModel();
    try {
      var response = await getResponse(
        path: ServiceConfiguration.customerData,
        method: Method.post,
        body: json.encode(value),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        result =
            CreateCustomerResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }

  Future<CreateCustomerResponseModel> updateCustomer(
      CreateCustomerInputModel value, int id) async {
    CreateCustomerResponseModel result = CreateCustomerResponseModel();
    try {
      var response = await getResponse(
        path: '${ServiceConfiguration.customerData}/$id',
        method: Method.put,
        body: json.encode(value),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        result =
            CreateCustomerResponseModel.fromJson(json.decode(response.body));
      } else {
        debugPrint('Error in calling signup api');
      }
      return result;
    } catch (e) {
      debugPrint('Error in calling signup api');
      return result;
    }
  }
}
