import 'dart:typed_data';

import 'package:distributor/shop.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _tagData = "";

  ValueNotifier<dynamic> result = ValueNotifier(null);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(child: Text('Tag Read'), onPressed: _tagRead),
          ],
        ),
      ),
    );
  }

  Future<void> _tagRead() async {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        Map tagData = tag.data;
        Map tagNdef = tagData['ndef'];
        Map cachedMessage = tagNdef['cachedMessage'];
        Map records = cachedMessage['records'][0];
        Uint8List payload = records['payload'];
        String payloadAsString = String.fromCharCodes(payload);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Shop(tag:payloadAsString)));
      },
    );

  }
}
