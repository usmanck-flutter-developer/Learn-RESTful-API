import 'dart:convert';
import 'package:api_learning_by_doing/api2/model_api_example2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample2 extends StatefulWidget {
  const ApiExample2({super.key});

  @override
  State<ApiExample2> createState() => _ApiExample2State();
}

class _ApiExample2State extends State<ApiExample2> {
  // Below
  // Empty List to Store all the Data Coming from the API
  List<PhotosModel> photosList = [];
  // Calling the API with Future
  Future<List<PhotosModel>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        // photoList.add(PhotosModel.fromJson(i));
        // Created Object of the photosModel
        PhotosModel photosModel = PhotosModel(
            title: i['title'], url: i['url'], thumbnailUrl: i['thumbnailUrl']);
        photosList.add(photosModel);
      }
      return photosList;
    } else {
      return photosList;
    }
  } // Ends Here Calling API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchData(),
            // What is and WHY AsyncSnapshot<List<PhotosModel>> ???
            builder: (context, AsyncSnapshot<List<PhotosModel>> snapshot) {
              return ListView.builder(
                itemCount: photosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          // These Profile are Coming from the API
                          snapshot.data![index].url.toString()
                          // OR
                          // Online Link for Profile Image
                          // 'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_1280.jpg'
                          ),
                    ),
                    title: Text(snapshot.data![index].title.toString()),
                    // You Can UnComment this
                    // trailing: CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       // These Profile are Coming from the API
                    //       snapshot.data![index].thumbnailUrl.toString()),
                    // ),
                  );
                },
              );
            }));
  }
}
