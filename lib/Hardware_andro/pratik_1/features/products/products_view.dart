import 'package:flutter/material.dart';
import 'products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ActionChip(
            avatar: Icon(
              Icons.check,
              color: Colors.green,
            ),
            label: Text("345 TL"),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Text(""),
        );
      }),
    );
  }
}
