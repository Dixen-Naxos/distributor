import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:distributor/dto/distributor.dart';

import '../dto/user.dart';

class ServiceAPI {
  final dio = Dio();

  Future<Distributor> getDistributor() async {
    final response = await dio.get('http://34.105.224.254/distributors/477b0e36-e58e-4596-a31f-a6801fcd2c31');
    return Distributor.fromJson(jsonDecode(response.toString()));
  }

  Future<void> buyProduct(String user_id, String product_id) async {
    await dio.put('http://34.105.224.254/distributors/477b0e36-e58e-4596-a31f-a6801fcd2c31/buyProduct/' + product_id + '/' + user_id);
  }

  Future<User> getUser(String user_id) async {
    final response = await dio.get("http://34.105.224.254/users/" + user_id);
    return User.fromJson(jsonDecode(response.toString()));
  }
}
