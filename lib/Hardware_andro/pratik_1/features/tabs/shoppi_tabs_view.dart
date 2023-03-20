import 'package:flutter/material.dart';

import '../products/products.dart';

class ShoppiTabView extends StatelessWidget {
  const ShoppiTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: buildBottomAppBar(),
        body: TabBarView(
          children: [
            Products(),
            Container(color: Colors.teal,),
          ],
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.ac_unit)),
          Tab(icon: Icon(Icons.ac_unit)),
        ],
      ),
    );
  }
}
