import 'package:flutter/material.dart';
import 'package:provider_ogreniyorum/own_projects/service.dart';
import 'package:provider_ogreniyorum/own_projects/view.dart';

import 'models.dart';

abstract class HomeViewModel extends LoadingStatefull<HomeView>
    with ProjectDioMixin {
  // servis ile bağlantı kuracak bir nesne oluşturalım
  late final IUserService userService;

  List<UserModel> modelList = [];

  @override
  void initState() {
    super.initState();
    userService = UserService(baseURL);
    _fetch();
  }

  Future<void> _fetch() async {

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
