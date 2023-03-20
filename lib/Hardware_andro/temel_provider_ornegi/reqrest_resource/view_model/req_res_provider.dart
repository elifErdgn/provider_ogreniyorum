import 'package:flutter/material.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/global/resource_context.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/service/reqres_service.dart';

import '../model/resourceModel.dart';

class ReqResProvider extends ChangeNotifier {
  /// changenotifier ekrana haber verebilmemiz için zorunlu
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }


}
