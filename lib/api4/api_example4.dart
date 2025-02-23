// Don't Judge me with the UI Please!

import 'dart:convert';
import 'package:api_learning_by_doing/api4/row_component_ex4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample4 extends StatefulWidget {
  const ApiExample4({super.key});

  @override
  State<ApiExample4> createState() => _ApiExample4State();
}

class _ApiExample4State extends State<ApiExample4> {
  // Without Creating or HAVING a Model Class
  dynamic data;
  Future<void> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      Text('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('A P I'),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home_filled,
              size: 32,
            ),
            Icon(
              Icons.settings,
              size: 32,
            ),
            Icon(
              Icons.backup_outlined,
              size: 32,
            ),
            Icon(
              Icons.exit_to_app,
              size: 32,
            ),
          ],
        ),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: data.length, // ??????
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // You can Handle As You Want
                          RowComponentEx4(
                            title: 'Name',
                            value: data[index]['name'].toString(),
                          ),
                          RowComponentEx4(
                            title: 'Address',
                            value: data[index]['address']['city'].toString(),
                          ),
                          RowComponentEx4(
                            title: 'Geo LAT',
                            value:
                                data[index]['address']['geo']['lat'].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
