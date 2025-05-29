import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open62541_ffi/open62541.dart';
import 'package:path_provider/path_provider.dart';

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
    server.addMethod(
        output: UAArgument(name: "name", uaType: UATypes.STRING),
        input: UAArgument(name: "name", uaType: UATypes.STRING),
        nodeId: UANodeId(1, 62541),
        browseName: UAQualifiedName(1, "name`"),
        callBack: (a, b) async {
          return "open62541 hello world!".uaString();
        });
  }

  String text = "connect 192.168.31.19";
  String text2 = "connect 192.168.31.193";
  UAClient client = UAClient();
  UAServer server = UAServer();
  String strServer = "start";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final Directory? downloadsDir = await getDownloadsDirectory();
                  print(downloadsDir!.path);
                  File(downloadsDir.path + "/text.txt")
                      .writeAsString("contents");
                },
                child: const Text("test path")),
            ElevatedButton(
                onPressed: () {
                  server.setAddress(ip: "192.168.31.193", port: 5505);
                  setState(() {
                    strServer += "${server.start()}";
                  });
                },
                child: Text(strServer)),
            ElevatedButton(
                onPressed: () async {
                  final rev = client.connect(ip: "192.168.31.19", port: 5505);
                  setState(() {
                    text = "connect: $rev";
                    print(text);
                  });
                  final res = await client.methodCall(
                      UANodeId(1, 62541), 'dart'.uaString());
                  setState(() {
                    text += ": $res";
                  });
                },
                child: Text(text)),
            ElevatedButton(
                onPressed: () async {
                  final rev = client.connect(ip: "192.168.31.193", port: 5505);
                  setState(() {
                    text2 = "connect: $rev";
                    print(text);
                  });
                  final res = await client.methodCall(
                      UANodeId(1, 62541), 'dart'.uaString());
                  setState(() {
                    text2 += ": $res";
                  });
                },
                child: Text(text2))
          ],
        ),
      ),
    );
  }
}
