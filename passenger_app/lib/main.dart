import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = 'Loading...';

  @override
  void initState() {
    super.initState();
    _checkHealth();
  }

  Future<void> _checkHealth() async {
    try {
      // For web & desktop, localhost is fine:
      final uri = Uri.parse('http://localhost:8000/health');
      final resp = await http.get(uri);
      if (resp.statusCode == 200) {
        final data = json.decode(resp.body);
        setState(() {
          _status = '${data['status']}: ${data['message']}';
        });
      } else {
        setState(() => _status = 'Error: ${resp.statusCode}');
      }
    } catch (e) {
      setState(() => _status = 'Failed to connect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PirssiCab Passenger',
      home: Scaffold(
        appBar: AppBar(title: const Text('PirssiCab Health Check')),
        body: Center(
          child: Text(
            _status,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
