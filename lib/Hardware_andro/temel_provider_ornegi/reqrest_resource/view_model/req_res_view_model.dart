import 'package:flutter/material.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/product_dio.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/model/resourceModel.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/service/reqres_service.dart';

import '../view/req_res_iew.dart';

/// ekranda kullanılacak servis isteklerini buradan atıyoruz.
/// EKRAN YONETME
/// abstract - soyut class

abstract class ReqresViewModel extends LoadingStatefull<ReqResView>
    with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
