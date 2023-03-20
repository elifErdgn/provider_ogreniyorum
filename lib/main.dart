import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/global/resource_context.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/global/theme_notifier.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/reqrest_resource/view/req_res_iew.dart';
import 'package:provider_ogreniyorum/udemy_dersler/ornek1/sayacModel.dart';

import 'Hardware_andro/pratik_1/features/tabs/shoppi_tabs_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ResourceContext()),
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier()),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SayacModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: context.watch<ThemeNotifier>().currentTheme,
        home: ReqResView(),
      ),
    );
  }
}
