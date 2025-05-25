import 'package:flutter/material.dart';
import 'dart:async';
import 'package:open62541_ffi/open62541.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  String text = "connect";
  UAClient client = UAClient();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final rev = client.connect("opc.tcp://192.168.31.193:4840/");
                  setState(() {
                    text = "connect: $rev";
                    print(text);
                  });
                  for (var i = 0; i < 1; i++) {
                    await Future.delayed(const Duration(milliseconds: 1));
                    print("read: ${await client.readAttr(UANodeId(1, "VAR"))}");
                  }
                },
                child: Text(text))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
