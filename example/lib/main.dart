import 'package:ffi/ffi.dart';
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
    // TODO: implement initState
    super.initState();
    server.setAddress();
    server.addVariableNodeId(
        uaVariant: "uaVariant".uaString(),
        nodeid: UANodeId(1, "VAR"),
        qualifiedName: UAQualifiedName(1, "qualifiedName"));
    server.start();
  }

  UAServer server = UAServer();
  UAClient client = UAClient();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final rev = client.connect("opc.tcp://127.0.0.1:4840/");
                  print("connect: $rev");

                  for (var i = 0; i < 5; i++) {
                    await Future.delayed(const Duration(milliseconds: 1));
                    print(await client.writeNodeIdAsync(
                        UANodeId(1, "VAR"), "$i".uaString()));
                    print(
                        "read: ${await client.readNodeIdAsync(UANodeId(1, "VAR"))}");

                    // print(
                    //     "method: ${await client.methodCallAsync(UANodeId(1, "METHOD"), 'dart'.uaString())}");
                  }
                },
                child: Text("child"))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
