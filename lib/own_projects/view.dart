import 'package:flutter/material.dart';
import 'package:provider_ogreniyorum/Hardware_andro/temel_provider_ornegi/product/product_dio.dart';
import 'package:provider_ogreniyorum/own_projects/service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        child: Icon(Icons.save),
      ),
      body: Column(),
    );
  }
}
