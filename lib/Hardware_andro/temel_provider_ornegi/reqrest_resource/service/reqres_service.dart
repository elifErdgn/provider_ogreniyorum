import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/model/resourceModel.dart';

abstract class IReqresService {
  IReqresService(this.dio);

  final Dio dio;

  // internete çıkacağız ve geri cevap döndürme ihtimalimiz var -- ? geri cevap dönmeyebilir null gelme izni var

  Future<ResourceModel?> fetchResourceItem();
}


class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    //final response = await dio.get('{${_ReqResPath.resource.name}');
    final response = await dio.get('/unknown');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String,dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
