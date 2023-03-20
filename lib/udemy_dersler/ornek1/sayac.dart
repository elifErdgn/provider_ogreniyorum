import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ogreniyorum/udemy_dersler/ornek1/sayacModel.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ana sayfa"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child) {
                return Text(
                  "${sayacModelNesne.sayacOku()}",
                  style: TextStyle(fontSize: 36),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page2()));
              },
              child: Center(child: Text("Geçiş yap")),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ana sayfa"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child) {
                return Text(
                  "${sayacModelNesne.sayacOku()}",
                  style: TextStyle(fontSize: 36),
                );
              },
            ),
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child) {
                return TextButton(
                  onPressed: () {
                    sayacModelNesne.sayacArttir();
                  },
                  child: Center(child: Text("Arttır")),
                );
              },
            ),
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child) {
                return TextButton(
                  onPressed: () {
                    sayacModelNesne.sayacAzalt(1);
                  },
                  child: Center(child: Text("Azalt")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
