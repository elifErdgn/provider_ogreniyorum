import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/extension/string_extension.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/global/resource_context.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/global/theme_notifier.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/product_dio.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/service/reqres_service.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/view_model/req_res_provider.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/view_model/req_res_view_model.dart';

import '../model/resourceModel.dart';

///
/// ********************************************************************
///  Görüntülenecek ilk ekran
///  provider ile veri değişimini takip ediyoruz ve fake bir sistemden web api çağırıyoruz
///

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // değişiklikleri takip edebilmek için
      create: (context) => ReqResProvider(ReqresService(service)),
      // providerımızı çağırmak şart ??
      builder: (context, child) {
        /// builder widgetları geliştirdiğimiz body kısmına benzetebiliriz.
        return Scaffold(
          floatingActionButton: _reqresFloatAction(),
          appBar: _reqresAppBar(),
          body: _reqresBody(),
        );
      },
    );
  }

  FloatingActionButton _reqresFloatAction() {
    return FloatingActionButton(
      onPressed: () {
        context
            .watch<ThemeNotifier>()
            .changeTheme(); // read sadece okuma yapıyor değişiklikleri takip edemiyor -- watch ise değişiklik olduğunda ekrana hegmen yansıtabiliyor.
      },
      child: Icon(Icons.light_mode_outlined),
    );
  }

  Widget _reqresBody() {
    return Column(
      children: [
        Selector<ReqResProvider, bool>(builder: (context, value, child) {
          return value ? const Placeholder() : Text("data");
        }, selector: (context, provider) {
          return provider.isLoading;
        }),
        Expanded(
            child: _resourceListView(
                context, context.watch<ReqResProvider>().resources)),
      ],
    );
  }

  AppBar _reqresAppBar() {
    return AppBar(
      title: context.watch<ReqResProvider>().isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : null,
      actions: [
        ElevatedButton(
            onPressed: () {
              context
                  .read<ReqResProvider>()
                  .saveToLocale(context.read<ResourceContext>());
            },
            child: Icon(Icons.ac_unit)),
      ],
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        inspect(items[index]);
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      },
      itemCount: items.length,
    );
  }
}
