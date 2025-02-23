import 'dart:convert'; // For JSON encoding and decoding
import 'package:api_learning_by_doing/api1/model_api_example1.dart'; // Importing the custom model for Posts
import 'package:flutter/material.dart'; // Flutter material package for UI components
import 'package:http/http.dart' as http; // For making HTTP requests

class ApiExample1 extends StatefulWidget {
  const ApiExample1({super.key}); // Stateful widget for the Home Screen

  @override
  State<ApiExample1> createState() =>
      _ApiExample1State(); // Creates the state for the widget
}

// Global list to store data fetched from the API
List<PostsModel> postList = [];

// Method to fetch data from the API
Future<List<PostsModel>> getPostApi() async {
  // Making an HTTP GET request to the API endpoint
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  // Decoding the JSON response into a Dart object
  var data = jsonDecode(response.body.toString());

  // Checking if the response status is OK (200)
  if (response.statusCode == 200) {
    // Clearing the list to avoid duplicate data
    postList.clear();
    // Iterating through the response data and adding it to the list
    for (Map i in data) {
      postList.add(PostsModel.fromJson(i)); // Parsing each item into the model
    }
    return postList; // Returning the populated list
  } else {
    // Returning the empty list in case of an error
    return postList;
  }
}

// State for the HomeScreen widget
class _ApiExample1State extends State<ApiExample1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main application structure with AppBar and Body
      appBar: AppBar(
        title: Text('A P I'), // Title of the application
      ),
      body: Padding(
        // Padding around the body content
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              // Expanded widget to allow the FutureBuilder to take available space
              child: FutureBuilder(
                future: getPostApi(), // Wait Until Fetch data from the API
                builder: (context, snapshot) {
                  // If data is not yet available, show a loading spinner
                  if (!snapshot.hasData) {
                    return Center(
                        child:
                            // You can use your CUSTOM Loader and Call Here
                            CircularProgressIndicator(
                                color: Colors.deepPurple));
                  } else {
                    // If data is available, display it using ListView.builder
                    return
                        // You Can make this INTO a METHOD and then simply CALL Here
                        // Display the Data Coming from the API
                        ListView.builder(
                      itemCount: postList.length, // Number of items to display
                      itemBuilder: (context, index) {
                        // Widget to display each item as a card and You can Change!!!SS
                        return Card(
                          elevation: 4, // Shadow effect for the card
                          shadowColor: Colors.deepPurple, // Shadow color
                          child: Padding(
                            // Padding inside the card
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              // Aligning content to the start
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Customise the Design as You Want
                                Text(
                                  'UserId', // Label for UserId
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postList[index]
                                    .userId
                                    .toString()), // Display UserId
                                Text(
                                  'Id', // Label for Id
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postList[index]
                                    .id
                                    .toString()), // Display Id
                                Text(
                                  'Title', // Label for Title
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postList[index]
                                    .title
                                    .toString()), // Display Title
                                Text(
                                  'Body', // Label for Body
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postList[index]
                                    .body
                                    .toString()), // Display Body content
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
