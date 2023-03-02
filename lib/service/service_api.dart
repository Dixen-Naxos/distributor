import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:distributor/dto/distributor.dart';

class ServiceAPI {
  final dio = Dio();

  Future<Distributor> getDistributor() async {
    final response = await dio.get('http://34.105.224.254/distributors/477b0e36-e58e-4596-a31f-a6801fcd2c31');
    return Distributor.fromJson(jsonDecode(response.toString()));
  }


}
