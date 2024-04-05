import 'package:flutter/material.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request page"),
      ),
      body: Center(
        child: Text(
          'Request',
        ),
      ),
    );
  }
}
