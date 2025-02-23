import 'dart:convert';
import 'package:api_learning_by_doing/api3/model_api_example3.dart';
import 'package:api_learning_by_doing/api3/row_component.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample3 extends StatefulWidget {
  const ApiExample3({super.key});

  @override
  State<ApiExample3> createState() => _ApiExample3State();
}

class _ApiExample3State extends State<ApiExample3> {
  // List where all data will be saved!
  List<UserModel> userList = [];
  // Getting API and Hitting it
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // WHY and WHAT?
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Use What ever you want to Build the UI and Display the Data
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // You May Design it AS YOU WANT!
                          RowComponent(
                              title: 'Name',
                              value: snapshot.data![index].name.toString()),
                          RowComponent(
                              title: 'UserName',
                              value: snapshot.data![index].username.toString()),
                          RowComponent(
                              title: 'Company',
                              value: snapshot.data![index].company.toString()),
                          RowComponent(
                              title: 'Adress City',
                              value: snapshot.data![index].address!.city
                                  .toString()),
                          RowComponent(
                              title: 'Website',
                              value: snapshot.data![index].website.toString()),
                          RowComponent(
                              title: 'Geo LAT',
                              value: snapshot.data![index].address!.geo!.lat
                                  .toString()),
                          RowComponent(
                              title: 'Geo LNG',
                              value: snapshot.data![index].address!.geo!.lng
                                  .toString()),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
