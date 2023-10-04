import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            final id = user[index];
            final employee_name = id['employee_name'];
            return ListTile(
              leading: Text(employee_name),

            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: FetchData,
      ),
    );
  }

  void FetchData() async {
    print("hello ");
    const url = 'https://dummy.restapiexample.com/api/v1/employees';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      user = json['data'];
    });
    print("hello complete");
  }
}
