import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  String? name;
   HomeView({super.key, this.name});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {  }, child: Text("${widget.name}"),
        ),
      ),
    );
  }
}



